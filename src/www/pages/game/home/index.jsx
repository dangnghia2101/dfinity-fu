import React, { useState, useEffect } from 'react';
import Swal from 'sweetalert2';
import { useNavigate } from 'react-router-dom';
import { useCanister, useConnect } from '@connect2ic/react';

import {
	Container,
	BoxClaimBorder,
	BoxClaim,
	TextBtn,
	ImgBtn,
	CardWrap
} from './home-claim';
import { withContext } from '../../../hooks';
import CardNft from '../../../components/card-nft';
import PopupList from '../../../components/popup-list';

function Homeclaim(props) {
	const { getUserInfo, prinpId, setopenProcess } = props
	const [superheroes, { loading, error }] = useCanister('superheroes');
	const navigate = useNavigate();
	const [open, setOpen] = useState(false);
	const [listNFt, setListNFt] = useState([]);

	const onClaim = async () => {
		try {
			setopenProcess(true)
			const res = await superheroes?.claiming();
			console.log(res);
			getUserInfo()
			await onGetData()
			setopenProcess(false)
			setOpen(true)
		} catch (er) {
			console.log(er);
		}
	};

	const onGetData = async () => {
		const resp = await superheroes?.getUserTokens(prinpId?.toString());
		console.log(resp);
		setListNFt(resp?.ok)

	};

	const dialogClaim = async () => {
		Swal.fire({
			title: 'Do you want to save the changes?',
			showDenyButton: true,
			showCancelButton: true,
			confirmButtonText: 'Save',
			denyButtonText: `Don't save`,
		}).then((result) => {
			/* Read more about isConfirmed, isDenied below */
			if (result.isConfirmed) {
				Swal.fire('Saved!', '', 'success').then((result) => {
					if (result.isConfirmed) {
						navigate('/');
					}
				});
			} else if (result.isDenied) {
				Swal.fire('Changes are not saved', '', 'info');
			}
		});
	};

	return (
		<>
			<Container>
				<BoxClaimBorder>
					<BoxClaim onClick={onClaim}>
						<ImgBtn src={'/images/sidebarButton.png'} alt='' />
						<TextBtn>Claim</TextBtn>
					</BoxClaim>
				</BoxClaimBorder>
				<PopupList open={open} setOpen={setOpen} maxWidth={'lg'}
					handleClosePopup={() => navigate('/')}
				>
					{listNFt.map((el, index) => {
						if (el?.detail?.nest?.inLand[0]) return
						return (
							<CardWrap>
								<CardNft
									key={index}
									data={el}
									alt=''
								/>
							</CardWrap>
						);
					})}
				</PopupList>
			</Container>
		</>
	);
}

export default withContext(Homeclaim);
