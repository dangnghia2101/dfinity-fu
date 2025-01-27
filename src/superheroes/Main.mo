/**
 * Module     : main.mo
 * Copyright  : 2022 Rocklabs Team
 * License    : Apache 2.0 with LLVM Exception
 * Stability  : Experimental
 */

// import Array "mo:base/Array";
import AID "/Lib/Ext/util/AccountIdentifier";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Cycles "mo:base/ExperimentalCycles";
import D "mo:base/Debug";
import Error "mo:base/Error";
import Ext "Ext";
import ExtCommon "/Lib/Ext/ext/Common";
import ExtCore "/Lib/Ext/ext/Core";
import ExtTypes "Ext/types";
import Float "mo:base/Float";
import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Nat32";
import Prelude "mo:base/Prelude";
import Principal "mo:base/Principal";
import List "mo:base/List";
import Result "mo:base/Result";
import Text "mo:base/Text";
import Time "mo:base/Time";
import TokenIndex "mo:base/Bool";
import Random "mo:base/Random";
import TrieSet "mo:base/TrieSet";
import Types "./types";
import User "./User";

shared(msg) actor class AntKingdoms(
    init_admin: Principal
    ) = this {

    // type Metadata = Types.Metadata;
    // type Location = Types.Location;
    // type Attribute = Types.Attribute;
    // type TokenMetadata = Types.TokenMetadata;
    // type Record = Types.Record;
    // type TxRecord = Types.TxRecord;
    // type Operation = Types.Operation;
    // type TokenInfo = Types.TokenInfo;
    // type OrderInfo = Types.OrderInfo;
    // type TokenInfoExt = Types.TokenInfoExt;
    // type UserInfo = Types.UserInfo;
    // type UserInfoExt = Types.UserInfoExt;

    // public type Errors = {
    //     #Unauthorized;
    //     #TokenNotExist;
    //     #InvalidOperator;
    // };
    // // to be compatible with Rust canister
    // // in Rust, Result is `Ok` and `Err`
    // public type TxReceipt = {
    //     #Ok: Nat;
    //     #Err: Errors;
    // };
    // public type MintResult = {
    //     #Ok: (Nat, Nat);
    //     #Err: Errors;
    // };

    // public type SaleInfo = {
        
    // };

    // public type SaleInfoExt = {
    //     amountLeft: Nat;
    //     fundRaised: Nat;
    //     devFee: Nat; // /1e6
    //     devAddr: Principal;
    //     paymentToken: Principal;
    //     fundClaimed: Bool;
    //     feeClaimed: Bool;
    // };

    // // DIP20 token actor
	// type DIP20Errors = {
    //     #InsufficientBalance;
    //     #InsufficientAllowance;
    //     #LedgerTrap;
    //     #AmountTooSmall;
    //     #BlockUsed;
    //     #ErrorOperationStyle;
    //     #ErrorTo;
    //     #Other;
    // };
    // type DIP20Metadata = {
    //     logo : Text;
    //     name : Text;
    //     symbol : Text;
    //     decimals : Nat8;
    //     totalSupply : Nat;
    //     owner : Principal;
    //     fee : Nat;
    // };
    // public type TxReceiptToken = {
    //     #Ok: Nat;
    //     #Err: DIP20Errors;
    // };
    // type TokenActor = actor {
    //     allowance: shared (owner: Principal, spender: Principal) -> async Nat;
    //     approve: shared (spender: Principal, value: Nat) -> async TxReceiptToken;
    //     balanceOf: (owner: Principal) -> async Nat;
    //     decimals: () -> async Nat8;
    //     name: () -> async Text;
    //     symbol: () -> async Text;
    //     getMetadata: () -> async DIP20Metadata;
    //     totalSupply: () -> async Nat;
    //     transfer: shared (to: Principal, value: Nat) -> async TxReceiptToken;
    //     transferFrom: shared (from: Principal, to: Principal, value: Nat) -> async TxReceiptToken;
    // };

    // public type WhitelistActor = actor {
    //     check: shared(user: Principal) -> async Bool;
    // };

    // private stable var saleInfo: ?SaleInfo = ?{
    //     // var fundRaised = 0;
    //     // devFee = _devFee;
    //     // devAddr = _devAddr;
    //     // paymentToken = _paymentToken;
    //     // var fundClaimed = false;
    //     // var feeClaimed = false;
    // };

    // private stable var logo_ : Text = _logo; // base64 encoded image
    // private stable var name_ : Text = _name;
    // private stable var symbol_ : Text = _symbol;
    // private stable var desc_ : Text = _desc;
    // private stable var owner_: Principal = _owner;
    // private stable var totalSupply_: Nat = 0;
    // private stable var blackhole: Principal = Principal.fromText("aaaaa-aa");
    // private stable var totalOrders_: Nat = 0;

    // private stable var tokensEntries : [(Nat, TokenInfo)] = [];
    // private stable var usersEntries : [(Principal, UserInfo)] = [];
    //  private var tokens = HashMap.HashMap<Nat, TokenInfo>(1, Nat.equal, Hash.hash);
    // private var users = HashMap.HashMap<Principal, UserInfo>(1, Principal.equal, Principal.hash);
    // private var orders = HashMap.HashMap<Nat, OrderInfo>(1, Nat.equal, Hash.hash);
    // private stable var txs: [TxRecord] = [];
    // private stable var txIndex: Nat = 0;

    // private func addTxRecord(
    //     caller: Principal, op: Operation, tokenIndex: ?Nat,
    //     from: Record, to: Record, timestamp: Time.Time
    // ): Nat {
    //     let record: TxRecord = {
    //         caller = caller;
    //         op = op;
    //         index = txIndex;
    //         tokenIndex = tokenIndex;
    //         from = from;
    //         to = to;
    //         timestamp = timestamp;
    //     };
    //     txs := Array.append(txs, [record]);
    //     txIndex += 1;
    //     return txIndex - 1;
    // };

    // private func _unwrap<T>(x : ?T) : T =
    // switch x {
    //   case null { Prelude.unreachable() };
    //   case (?x_) { x_ };
    // };
    
    // private func _exists(tokenId: Nat) : Bool {
    //     switch (tokens.get(tokenId)) {
    //         case (?info) { return true; };
    //         case _ { return false; };
    //     }
    // };

    // private func _ownerOf(tokenId: Nat) : ?Principal {
    //     switch (tokens.get(tokenId)) {
    //         case (?info) { return ?info.owner; };
    //         case (_) { return null; };
    //     }
    // };

    // private func _isOwner(who: Principal, tokenId: Nat) : Bool {
    //     switch (tokens.get(tokenId)) {
    //         case (?info) { return info.owner == who; };
    //         case _ { return false; };
    //     };
    // };

    // private func _isApproved(who: Principal, tokenId: Nat) : Bool {
    //     switch (tokens.get(tokenId)) {
    //         case (?info) { return info.operator == ?who; };
    //         case _ { return false; };
    //     }
    // };
    
    // private func _balanceOf(who: Principal) : Nat {
    //     switch (users.get(who)) {
    //         case (?user) { return TrieSet.size(user.tokens); };
    //         case (_) { return 0; };
    //     }
    // };

    // private func _newUser() : UserInfo {
    //     {
    //         var operators = TrieSet.empty<Principal>();
    //         var allowedBy = TrieSet.empty<Principal>();
    //         var allowedTokens = TrieSet.empty<Nat>();
    //         var tokens = TrieSet.empty<Nat>();
    //     }
    // };

    // private func _tokenInfotoExt(info: TokenInfo) : TokenInfoExt {
    //     return {
    //         index = info.index;
    //         owner = info.owner;
    //         metadata = info.metadata;
    //         timestamp = info.timestamp;
    //         operator = info.operator;
    //     };
    // };

    // private func _userInfotoExt(info: UserInfo) : UserInfoExt {
    //     return {
    //         operators = TrieSet.toArray(info.operators);
    //         allowedBy = TrieSet.toArray(info.allowedBy);
    //         allowedTokens = TrieSet.toArray(info.allowedTokens);
    //         tokens = TrieSet.toArray(info.tokens);
    //     };
    // };

    // private func _isApprovedOrOwner(spender: Principal, tokenId: Nat) : Bool {
    //     switch (_ownerOf(tokenId)) {
    //         case (?owner) {
    //             return spender == owner or _isApproved(spender, tokenId) or _isApprovedForAll(owner, spender);
    //         };
    //         case _ {
    //             return false;
    //         };
    //     };        
    // };

    // private func _getApproved(tokenId: Nat) : ?Principal {
    //     switch (tokens.get(tokenId)) {
    //         case (?info) {
    //             return info.operator;
    //         };
    //         case (_) {
    //             return null;
    //         };
    //     }
    // };

    // private func _isApprovedForAll(owner: Principal, operator: Principal) : Bool {
    //     switch (users.get(owner)) {
    //         case (?user) {
    //             return TrieSet.mem(user.operators, operator, Principal.hash(operator), Principal.equal);
    //         };
    //         case _ { return false; };
    //     };
    // };

    // private func _addTokenTo(to: Principal, tokenId: Nat) {
    //     switch(users.get(to)) {
    //         case (?user) {
    //             user.tokens := TrieSet.put(user.tokens, tokenId, Hash.hash(tokenId), Nat.equal);
    //             users.put(to, user);
    //         };
    //         case _ {
    //             let user = _newUser();
    //             user.tokens := TrieSet.put(user.tokens, tokenId, Hash.hash(tokenId), Nat.equal);
    //             users.put(to, user);
    //         };
    //     }
    // }; 

    // private func _removeTokenFrom(owner: Principal, tokenId: Nat) {
    //     assert(_exists(tokenId) and _isOwner(owner, tokenId));
    //     switch(users.get(owner)) {
    //         case (?user) {
    //             user.tokens := TrieSet.delete(user.tokens, tokenId, Hash.hash(tokenId), Nat.equal);
    //             users.put(owner, user);
    //         };
    //         case _ {
    //             assert(false);
    //         };
    //     }
    // };
   
    // private func _clearApproval(owner: Principal, tokenId: Nat) {
    //     assert(_exists(tokenId) and _isOwner(owner, tokenId));
    //     switch (tokens.get(tokenId)) {
    //         case (?info) {
    //             if (info.operator != null) {
    //                 let op = _unwrap(info.operator);
    //                 let opInfo = _unwrap(users.get(op));
    //                 opInfo.allowedTokens := TrieSet.delete(opInfo.allowedTokens, tokenId, Hash.hash(tokenId), Nat.equal);
    //                 users.put(op, opInfo);
    //                 info.operator := null;
    //                 tokens.put(tokenId, info);
    //             }
    //         };
    //         case _ {
    //             assert(false);
    //         };
    //     }
    // };  

    // private func _transfer(to: Principal, tokenId: Nat) {
    //     assert(_exists(tokenId));
    //     switch(tokens.get(tokenId)) {
    //         case (?info) {
    //             _removeTokenFrom(info.owner, tokenId);
    //             _addTokenTo(to, tokenId);
    //             info.owner := to;
    //             tokens.put(tokenId, info);
    //         };
    //         case (_) {
    //             assert(false);
    //         };
    //     };
    // };

    // private func _burn(owner: Principal, tokenId: Nat) {
    //     _clearApproval(owner, tokenId);
    //     _transfer(blackhole, tokenId);
    // };

    // private func _batchMint(to: Principal, amount: Nat): async Bool {
    //     var startIndex = totalSupply_;
    //     var endIndex = startIndex + amount;
    //     while(startIndex < endIndex) {
    //         let token: TokenInfo = {
    //             index = totalSupply_;
    //             var owner = to;
    //             var metadata = null;
    //             var operator = null;
    //             timestamp = Time.now();
    //         };
    //         tokens.put(totalSupply_, token);
    //         _addTokenTo(to, totalSupply_);
    //         totalSupply_ += 1;
    //         startIndex += 1;
    //         ignore addTxRecord(msg.caller, #mint(null), ?token.index, #user(blackhole), #user(to), Time.now());
    //     };
    //     return true;
    // };

    // public shared(msg) func setSaleInfo(info: ?SaleInfoExt): async ?SaleInfoExt {
    //     assert(msg.caller == owner_);
    //     switch(info) {
    //         case(?i) {
    //             saleInfo := ?{
    //                 var amountLeft = i.amountLeft;
    //                 var fundRaised = i.fundRaised;
    //                 devFee = i.devFee;
    //                 devAddr = i.devAddr;
    //                 paymentToken = i.paymentToken;
    //                 var fundClaimed = false;
    //                 var feeClaimed = false;
    //             };
    //             return info;
    //         };
    //         case(_) {
    //             saleInfo := null;
    //             return null;
    //         };
    //     };
    // };

    // public query func getSaleInfo(): async ?SaleInfoExt {
    //     switch(saleInfo) {
    //         case(?i) {
    //             ?{
    //                 amountLeft = i.amountLeft;
    //                 fundRaised = i.fundRaised;
    //                 devFee = i.devFee;
    //                 devAddr = i.devAddr;
    //                 price = i.price;
    //                 paymentToken = i.paymentToken;
    //                 whitelist = i.whitelist;
    //                 fundClaimed = i.fundClaimed;
    //                 feeClaimed = i.feeClaimed;
    //             }
    //         };
    //         case(_) {
    //             null
    //         };
    //     }
    // };

    // public shared(msg) func createOrder(_tokenId: Nat, _price: Nat) {
    //     var owner: Principal = switch (_ownerOf(_tokenId)) {
    //         case (?own) {
    //             own;
    //         };
    //         case (_) {
    //             return #Err(#TokenNotExist)
    //         };
    //     };
    //     if(owner != msg.caller) {
    //         // return #Err(#Unauthorized);
    //     };

    //     // let order: OrderInfo = {
    //     //     index = totalOrders_;
    //     //     var owner = msg.caller;
    //     //     var price: Nat = price;
    //     //     tokenId = _tokenId;
    //     // }
    //     // totalOrders_+=1;
    //     orders.put(totalOrders_, order);
        
    //     let txid = addTxRecord(msg.caller, #transfer, ?_tokenId, #user(msg.caller), #user(blachole), Time.now());
    //     return #Ok(txid);

    // };

    // public shared(msg) func buy( tokenId: Nat): async Result.Result<Nat, Text> {
    //     switch(orders.get(tokenId)) {
    //         case (?order) {
    //             let userBalance = _balanceOf(msg.caller);
    //                     // switch(info.whitelist){
    //                     //     case(?whitelist){
    //                     //         let whitelistActor: WhitelistActor = actor(Principal.toText(whitelist));
    //                     //         switch(await whitelistActor.check(msg.caller)){
    //                     //             case(false) {
    //                     //                 return #err("you are not in the whitelist");
    //                     //             };
    //                     //             case(true) { };
    //                     //         };
    //                     //     };
    //                     //     case(_) {};
    //                     // };
    //                     let tokenActor: TokenActor = actor(Principal.toText(info.paymentToken));
    //                     switch(await tokenActor.transferFrom(msg.caller, order.owner, order.price)) {
    //                         case(#Ok(id)) {
    //                             ignore _batchMint(msg.caller, amount);
    //                             _removeTokenFrom(order.owner, order.tokenId);
    //                             _addTokenTo(msg.caller, order.tokenId);
    //                             orders := TrieSet.delete(orders, tokenId, Hash.hash(tokenId), Nat.equal);
    //                             info.fundRaised += amount * order.price;
    //                             saleInfo := ?info;
    //                             return #ok(amount);
    //                         };
    //                         case(#Err(e)) {
    //                             return #err("payment failed");
    //                         };
    //                     };
    //         };
    //         case _ {
    //             return #err("order not found");
    //         }
    //     }
       
    // };

	// public shared(msg) func setOwner(new: Principal): async Principal {
	// 	assert(msg.caller == owner_);
	// 	owner_ := new;
	// 	new
	// };

    // public shared(msg) func claimFunds(): async Result.Result<(Bool, Bool), Text> {
    //     let info = switch(saleInfo) {
    //         case(?i) { i };
    //         case(_) { return #err("no sale"); };
    //     };
    //     assert(msg.caller == owner_ or msg.caller == info.devAddr);


    //     let tokenActor: TokenActor = actor(Principal.toText(info.paymentToken));
    //     let metadata = await tokenActor.getMetadata();
    //     if(not info.fundClaimed) {
    //         info.fundClaimed := true;
    //         saleInfo := ?info;
    //         switch(await tokenActor.transfer(owner_, info.fundRaised - fee - metadata.fee)) {
    //             case(#Ok(id)) {};
    //             case(#Err(e)) {
    //                 info.fundClaimed := false;
    //                 saleInfo := ?info;
    //             };
    //         };
    //     };
    //     if(not info.feeClaimed) {
    //         info.feeClaimed := true;
    //         saleInfo := ?info;
    //         switch(await tokenActor.transfer(info.devAddr, fee - metadata.fee)) {
    //             case(#Ok(id)) {};
    //             case(#Err(e)) {
    //                 info.feeClaimed := false;
    //                 saleInfo := ?info;
    //             };
    //         };
    //     };
    //     #ok((info.fundClaimed, info.feeClaimed))
    // };

    // public update calls
    // public shared(msg) func mint(to: Principal, metadata: ?TokenMetadata): async MintResult {
    //     // if(msg.caller != owner_) {
    //     //     return #Err(#Unauthorized);
    //     // };
    //     let token: TokenInfo = {
    //         index = totalSupply_;
    //         var owner = to;
    //         var metadata = metadata;
    //         var operator = null;
    //         timestamp = Time.now();
    //     };
    //     tokens.put(totalSupply_, token);
    //     _addTokenTo(to, totalSupply_);
    //     totalSupply_ += 1;
    //     let txid = addTxRecord(msg.caller, #mint(metadata), ?token.index, #user(blackhole), #user(to), Time.now());
    //     return #Ok((token.index, txid));
    // };

    // public shared(msg) func batchMint(to: Principal, arr: [?TokenMetadata]): async MintResult {
    //     if(msg.caller != owner_) {
    //         return #Err(#Unauthorized);
    //     };
    //     let startIndex = totalSupply_;
    //     for(metadata in Iter.fromArray(arr)) {
    //         let token: TokenInfo = {
    //             index = totalSupply_;
    //             var owner = to;
    //             var metadata = metadata;
    //             var operator = null;
    //             timestamp = Time.now();
    //         };
    //         tokens.put(totalSupply_, token);
    //         _addTokenTo(to, totalSupply_);
    //         totalSupply_ += 1;
    //         ignore addTxRecord(msg.caller, #mint(metadata), ?token.index, #user(blackhole), #user(to), Time.now());
    //     };
    //     return #Ok((startIndex, txs.size() - arr.size()));
    // };

    // public shared(msg) func burn(tokenId: Nat): async TxReceipt {
    //     if(_exists(tokenId) == false) {
    //         return #Err(#TokenNotExist)
    //     };
    //     if(_isOwner(msg.caller, tokenId) == false) {
    //         return #Err(#Unauthorized);
    //     };
    //     _burn(msg.caller, tokenId); //not delete tokenId from tokens temporarily. (consider storage limited, it should be delete.)
    //     let txid = addTxRecord(msg.caller, #burn, ?tokenId, #user(msg.caller), #user(blackhole), Time.now());
    //     return #Ok(txid);
    // };

    // public shared(msg) func setTokenMetadata(tokenId: Nat, new_metadata: TokenMetadata) : async TxReceipt {
    //     // only canister owner can set
    //     if(msg.caller != owner_) {
    //         return #Err(#Unauthorized);
    //     };
    //     if(_exists(tokenId) == false) {
    //         return #Err(#TokenNotExist)
    //     };
    //     let token = _unwrap(tokens.get(tokenId));
    //     let old_metadate = token.metadata;
    //     token.metadata := ?new_metadata;
    //     tokens.put(tokenId, token);
    //     let txid = addTxRecord(msg.caller, #setMetadata, ?token.index, #metadata(old_metadate), #metadata(?new_metadata), Time.now());
    //     return #Ok(txid);
    // };

    // public shared(msg) func batchSetTokenMetadata(arr: [(Nat, TokenMetadata)]) : async TxReceipt {
    //     // only canister owner can set
    //     if(msg.caller != owner_) {
    //         return #Err(#Unauthorized);
    //     };
    //     var txid = 0;
    //     for((tokenId, metadata) in Iter.fromArray(arr)) {
    //         if(_exists(tokenId) == false) {
    //             return #Err(#TokenNotExist)
    //         };
    //         let token = _unwrap(tokens.get(tokenId));
    //         let old_metadate = token.metadata;
    //         token.metadata := ?metadata;
    //         tokens.put(tokenId, token);
    //         txid := addTxRecord(msg.caller, #setMetadata, ?token.index, #metadata(old_metadate), #metadata(?metadata), Time.now());
    //     };
    //     return #Ok(txid);
    // };

    // public shared(msg) func approve(tokenId: Nat, operator: Principal) : async TxReceipt {
    //     var owner: Principal = switch (_ownerOf(tokenId)) {
    //         case (?own) {
    //             own;
    //         };
    //         case (_) {
    //             return #Err(#TokenNotExist)
    //         }
    //     };
    //     if(Principal.equal(msg.caller, owner) == false)
    //         if(_isApprovedForAll(owner, msg.caller) == false)
    //             return #Err(#Unauthorized);
    //     if(owner == operator) {
    //         return #Err(#InvalidOperator);
    //     };
    //     switch (tokens.get(tokenId)) {
    //         case (?info) {
    //             info.operator := ?operator;
    //             tokens.put(tokenId, info);
    //         };
    //         case _ {
    //             return #Err(#TokenNotExist);
    //         };
    //     };
    //     switch (users.get(operator)) {
    //         case (?user) {
    //             user.allowedTokens := TrieSet.put(user.allowedTokens, tokenId, Hash.hash(tokenId), Nat.equal);
    //             users.put(operator, user);
    //         };
    //         case _ {
    //             let user = _newUser();
    //             user.allowedTokens := TrieSet.put(user.allowedTokens, tokenId, Hash.hash(tokenId), Nat.equal);
    //             users.put(operator, user);
    //         };
    //     };
    //     let txid = addTxRecord(msg.caller, #approve, ?tokenId, #user(msg.caller), #user(operator), Time.now());
    //     return #Ok(txid);
    // };

    // public shared(msg) func setApprovalForAll(operator: Principal, value: Bool): async TxReceipt {
    //     if(msg.caller == operator) {
    //         return #Err(#Unauthorized);
    //     };
    //     var txid = 0;
    //     if value {
    //         let caller = switch (users.get(msg.caller)) {
    //             case (?user) { user };
    //             case _ { _newUser() };
    //         };
    //         caller.operators := TrieSet.put(caller.operators, operator, Principal.hash(operator), Principal.equal);
    //         users.put(msg.caller, caller);
    //         let user = switch (users.get(operator)) {
    //             case (?user) { user };
    //             case _ { _newUser() };
    //         };
    //         user.allowedBy := TrieSet.put(user.allowedBy, msg.caller, Principal.hash(msg.caller), Principal.equal);
    //         users.put(operator, user);
    //         txid := addTxRecord(msg.caller, #approveAll, null, #user(msg.caller), #user(operator), Time.now());
    //     } else {
    //         switch (users.get(msg.caller)) {
    //             case (?user) {
    //                 user.operators := TrieSet.delete(user.operators, operator, Principal.hash(operator), Principal.equal);    
    //                 users.put(msg.caller, user);
    //             };
    //             case _ { };
    //         };
    //         switch (users.get(operator)) {
    //             case (?user) {
    //                 user.allowedBy := TrieSet.delete(user.allowedBy, msg.caller, Principal.hash(msg.caller), Principal.equal);    
    //                 users.put(operator, user);
    //             };
    //             case _ { };
    //         };
    //         txid := addTxRecord(msg.caller, #revokeAll, null, #user(msg.caller), #user(operator), Time.now());
    //     };
    //     return #Ok(txid);
    // };

    // public shared(msg) func transfer(to: Principal, tokenId: Nat): async TxReceipt {
    //     var owner: Principal = switch (_ownerOf(tokenId)) {
    //         case (?own) {
    //             own;
    //         };
    //         case (_) {
    //             return #Err(#TokenNotExist)
    //         }
    //     };
    //     if (owner != msg.caller) {
    //         return #Err(#Unauthorized);
    //     };
    //     _clearApproval(msg.caller, tokenId);
    //     _transfer(to, tokenId);
    //     let txid = addTxRecord(msg.caller, #transfer, ?tokenId, #user(msg.caller), #user(to), Time.now());
    //     return #Ok(txid);
    // };

    // public shared(msg) func transferFrom(from: Principal, to: Principal, tokenId: Nat): async TxReceipt {
    //     if(_exists(tokenId) == false) {
    //         return #Err(#TokenNotExist)
    //     };
    //     if(_isApprovedOrOwner(msg.caller, tokenId) == false) {
    //         return #Err(#Unauthorized);
    //     };
    //     _clearApproval(from, tokenId);
    //     _transfer(to, tokenId);
    //     let txid = addTxRecord(msg.caller, #transferFrom, ?tokenId, #user(from), #user(to), Time.now());
    //     return #Ok(txid);
    // };

    // public shared(msg) func batchTransferFrom(from: Principal, to: Principal, tokenIds: [Nat]): async TxReceipt {
    //     var num: Nat = 0;
    //     label l for(tokenId in Iter.fromArray(tokenIds)) {
    //         if(_exists(tokenId) == false) {
    //             continue l;
    //         };
    //         if(_isApprovedOrOwner(msg.caller, tokenId) == false) {
    //             continue l;
    //         };
    //         _clearApproval(from, tokenId);
    //         _transfer(to, tokenId);
    //         num += 1;
    //         ignore addTxRecord(msg.caller, #transferFrom, ?tokenId, #user(from), #user(to), Time.now());
    //     };
    //     return #Ok(txs.size() - num);
    // };

    // // public query function 
    // public query func logo(): async Text {
    //     return logo_;
    // };

    // public query func name(): async Text {
    //     return name_;
    // };

    // public query func symbol(): async Text {
    //     return symbol_;
    // };

    // public query func desc(): async Text {
    //     return desc_;
    // };

    // public query func balanceOf(who: Principal): async Nat {
    //     return _balanceOf(who);
    // };

    // public query func totalSupply(): async Nat {
    //     return totalSupply_;
    // };

    // // get metadata about this NFT collection
    // public query func getMetadata(): async Metadata {
    //     {
    //         logo = logo_;
    //         name = name_;
    //         symbol = symbol_;
    //         desc = desc_;
    //         totalSupply = totalSupply_;
    //         owner = owner_;
    //         cycles = Cycles.balance();
    //     }
    // };

    // public query func isApprovedForAll(owner: Principal, operator: Principal) : async Bool {
    //     return _isApprovedForAll(owner, operator);
    // };

    // public query func getOperator(tokenId: Nat) : async Principal {
    //     switch (_exists(tokenId)) {
    //         case true {
    //             switch (_getApproved(tokenId)) {
    //                 case (?who) {
    //                     return who;
    //                 };
    //                 case (_) {
    //                     return Principal.fromText("aaaaa-aa");
    //                 };
    //             }   
    //         };
    //         case (_) {
    //             throw Error.reject("token not exist")
    //         };
    //     }
    // };

    // public query func getUserInfo(who: Principal) : async UserInfoExt {
    //     switch (users.get(who)) {
    //         case (?user) {
    //             return _userInfotoExt(user)
    //         };
    //         case _ {
    //             throw Error.reject("unauthorized");
    //         };
    //     };        
    // };

    // public query func getUserTokens(owner: Principal) : async [TokenInfoExt] {
    //     let tokenIds = switch (users.get(owner)) {
    //         case (?user) {
    //             TrieSet.toArray(user.tokens)
    //         };
    //         case _ {
    //             []
    //         };
    //     };
    //     let ret = Buffer.Buffer<TokenInfoExt>(tokenIds.size());
    //     for(id in Iter.fromArray(tokenIds)) {
    //         ret.add(_tokenInfotoExt(_unwrap(tokens.get(id))));
    //     };
    //     return ret.toArray();
    // };

    // public query func ownerOf(tokenId: Nat): async Principal {
    //     switch (_ownerOf(tokenId)) {
    //         case (?owner) {
    //             return owner;
    //         };
    //         case _ {
    //             throw Error.reject("token not exist")
    //         };
    //     }
    // };

    // public query func getTokenInfo(tokenId: Nat) : async TokenInfoExt {
    //     switch(tokens.get(tokenId)){
    //         case(?tokeninfo) {
    //             return _tokenInfotoExt(tokeninfo);
    //         };
    //         case(_) {
    //             throw Error.reject("token not exist");
    //         };
    //     };
    // };

    // // Optional
    // public query func getAllTokens() : async [TokenInfoExt] {
    //     Iter.toArray(Iter.map(tokens.entries(), func (i: (Nat, TokenInfo)): TokenInfoExt {_tokenInfotoExt(i.1)}))
    // };

    // // transaction history related
    // public query func historySize(): async Nat {
    //     return txs.size();
    // };

    // public query func getTransaction(index: Nat): async TxRecord {
    //     return txs[index];
    // };

    // public query func getTransactions(start: Nat, limit: Nat): async [TxRecord] {
    //     let res = Buffer.Buffer<TxRecord>(limit);
    //     var i = start;
    //     while (i < start + limit and i < txs.size()) {
    //         res.add(txs[i]);
    //         i += 1;
    //     };
    //     return res.toArray();
    // };

    // public query func getUserTransactionAmount(user: Principal): async Nat {
    //     var res: Nat = 0;
    //     for (i in txs.vals()) {
    //         if (i.caller == user or i.from == #user(user) or i.to == #user(user)) {
    //             res += 1;
    //         };
    //     };
    //     return res;
    // };

    // public query func getUserTransactions(user: Principal, start: Nat, limit: Nat): async [TxRecord] {
    //     let res = Buffer.Buffer<TxRecord>(limit);
    //     var idx = 0;
    //     label l for (i in txs.vals()) {
    //         if (i.caller == user or i.from == #user(user) or i.to == #user(user)) {
    //             if(idx < start) {
    //                 idx += 1;
    //                 continue l;
    //             };
    //             if(idx >= start + limit) {
    //                 break l;
    //             };
    //             res.add(i);
    //             idx += 1;
    //         };
    //     };
    //     return res.toArray();
    // };

    
    // // upgrade functions
    // system func preupgrade() {
    //     usersEntries := Iter.toArray(users.entries());
    //     tokensEntries := Iter.toArray(tokens.entries());
    // };

    // system func postupgrade() {
    //     type TokenInfo = Types.TokenInfo;
    //     type UserInfo = Types.UserInfo;
    //     type OrderInfo = Types.OrderInfo;

    //     users := HashMap.fromIter<Principal, UserInfo>(usersEntries.vals(), 1, Principal.equal, Principal.hash);
    //     tokens := HashMap.fromIter<Nat, TokenInfo>(tokensEntries.vals(), 1, Nat.equal, Hash.hash);
    //     usersEntries := [];
    //     tokensEntries := [];
    // };

    
  // Types
  type AccountIdentifier = ExtCore.AccountIdentifier;
  type SubAccount = ExtCore.SubAccount;
  type User = ExtCore.User;
  type Balance = ExtCore.Balance;
  type TokenIdentifier = ExtCore.TokenIdentifier;
  type TokenIndex = ExtCore.TokenIndex;
  type Extension = ExtCore.Extension;
  type CommonError = ExtCore.CommonError;
  type NotifyService = ExtCore.NotifyService;
  
  type BalanceRequest = ExtCore.BalanceRequest;
  type BalanceResponse = ExtCore.BalanceResponse;
  type TransferRequest = ExtCore.TransferRequest;
  type TransferResponse = ExtCore.TransferResponse;
  type Metadata = Types.Metadata;
    type UserInfo = Types.UserInfo;
    type UserInfoExt = Types.UserInfoExt;
    type AttributeMeta= Types.AttributeMeta;
    type MetadataExt = Types.MetadataExt;
    type DetailNFT = Types.DetailNFT;
    type UserState = Types.UserState;
    type Resource = Types.Resource;
    type WorkerFarmRequest = Types.WorkerFarmRequest;
    type LevelData = Types.LevelData;
    type ResourceInt= Types.ResourceInt;
     type OrderInfo= Types.OrderInfo;

  type RegisterTokenRequest = {
    metadata : MetadataExt;
    supply : Balance;
    owner : AccountIdentifier;
  };

  type ClaimRequest = {
    owner : AccountIdentifier;
  };
     // DIP20 token actor
	type DIP20Errors = {
        #InsufficientBalance;
        #InsufficientAllowance;
        #LedgerTrap;
        #AmountTooSmall;
        #BlockUsed;
        #ErrorOperationStyle;
        #ErrorTo;
        #Other;
    };
    type DIP20Metadata = {
        logo : Text;
        name : Text;
        symbol : Text;
        decimals : Nat8;
        totalSupply : Nat;
        owner : Principal;
        fee : Nat;
    };
public type TxReceiptToken = {
        #Ok: Nat;
        #Err: DIP20Errors;
    };
   type TokenActor = actor {
        allowance: shared (owner: Principal, spender: Principal) -> async Nat;
        approve: shared (spender: Principal, value: Nat) -> async TxReceiptToken;
        balanceOf: (owner: Principal) -> async Nat;
        decimals: () -> async Nat8;
        name: () -> async Text;
        symbol: () -> async Text;
        getMetadata: () -> async DIP20Metadata;
        totalSupply: () -> async Nat;
        transfer: shared (to: Principal, value: Nat) -> async TxReceiptToken;
        transferFrom: shared (from: Principal, to: Principal, value: Nat) -> async TxReceiptToken;
    };

  type TokenLedger = HashMap.HashMap<AccountIdentifier, Balance>;
  
  private let EXTENSIONS : [Extension] = ["@ext/common"];

  private let NFT_CLAIMABLE : [[Nat]] = [[0],[1,2,3,4,5],[11,12,13,14,15], [16,17,18,19,20]];

private let NFT_TYPE : [Text] =   ["Queen","Worker","Nest", "Land", "Kingdom"];
private let NFT_RARITY : [Text] =   ["Common","Uncommon","Rare", "Epec", "Legendary"];
// Ant state: 0:Idle , 1:Egg , 2: Farming
//
  private let ANT_STATE : [Nat] = [0,1,2];

  private let _minuteTime = 60 * 1_000_000_000;
  
  //State work
  private var CREATE_TOKEN_FEE : Nat = 1_000_000_000_000;
  private stable var _nextTokenId : TokenIndex = 1;
  private stable var _nextFarmId : TokenIndex = 0;
  private stable var _registryState : [(TokenIndex, [(AccountIdentifier, Balance)])] = [];
  private stable var _metadataState : [(TokenIndex, (Metadata, Balance))] = [];
  private stable var _admin : Principal = init_admin;
  private stable var usersEntries : [(AccountIdentifier, UserInfo)] = [];
  private var users = HashMap.HashMap<AccountIdentifier, UserInfo>(1, Text.equal, Text.hash);
  
  private var _registry = HashMap.HashMap<TokenIndex, TokenLedger>(1, Nat32.equal, func(x : Nat32) : Hash.Hash {x});
  Iter.iterate<(TokenIndex, [(AccountIdentifier, Balance)])>(_registryState.vals(), func(x, _index) {
    _registry.put(x.0, HashMap.fromIter(x.1.vals(), 0, AID.equal, AID.hash));
  });
  
  private var _metadata = HashMap.HashMap<TokenIndex, (Metadata, Balance)>(1, Nat32.equal, func(x : Nat32) : Hash.Hash {x});
  Iter.iterate<(TokenIndex, (Metadata, Balance))>(_metadataState.vals(), func(x, _index) {
    _metadata.put(x.0, x.1);
  });

  private var tokensMetadata = HashMap.HashMap<Nat, MetadataExt>(1, Nat.equal, Hash.hash);

  private var levelMetadata: [Types.LevelData] = [];

  //State functions
  system func preupgrade() {
    Iter.iterate(_registry.entries(), func(x : (TokenIndex, TokenLedger), _index : Nat) {
      _registryState := Array.append(_registryState, [(x.0, Iter.toArray(x.1.entries()))]);
    });
    _metadataState := Iter.toArray(_metadata.entries());
    usersEntries := Iter.toArray(users.entries());
  };
  system func postupgrade() {
    _registryState := [];
    _metadataState := [];
    users := HashMap.fromIter<AccountIdentifier, UserInfo>(usersEntries.vals(), 1, Text.equal, Text.hash);
    usersEntries := [];
  };

   private stable var totalOrders_: Nat = 0;
    private var orders = HashMap.HashMap<Nat, OrderInfo>(1, Nat.equal, Hash.hash);


  
    private func _isOwnerOf(tokenId: TokenIndex, who: AccountIdentifier) : Bool {
      var tokenBalances = switch(_registry.get(tokenId)) {
      case (?balances) balances;
      case (_) return false;
    };
         var rs = switch (tokenBalances.get(who)) {
              case (newRs) { 
                return true;
              };
              case (_) {return false}
         };
        return rs;
    };
  
  public shared(msg) func changeAdmin(newAdmin : Principal) : async () {
    assert(msg.caller == _admin);
    _admin := newAdmin;
  };

  public shared(msg) func setTokensMetadata(listMeta: [MetadataExt]): async Result.Result<Bool, Text> {
     assert(msg.caller == _admin);
     var i = 0;
    for(metadata in Iter.fromArray(listMeta)) {
      tokensMetadata.put(i, metadata);
      i +=1;
    };
    return #ok(true);
  };

  public shared(msg) func setLevelMetadata(listMeta: [LevelData]): async Result.Result<[LevelData], Text> {
    levelMetadata:=listMeta;
    return #ok(levelMetadata);
  };

   public shared(msg) func getTokensMetadata(): async [MetadataExt] {
      assert(msg.caller == _admin);
     Iter.toArray(Iter.map(tokensMetadata.entries(), func (i: (Nat, MetadataExt)): MetadataExt {i.1}))
   };

   private func _tokenMetadata(info: Metadata) : MetadataExt {
     return {
       name = info.name;
        description = info.description;
        image= info.image;
        attributes= info.attributes;
        detail= info.detail;
        tokenId = ?info.tokenId;
     }
   };

  private func checkTypeToken(tokenId: TokenIndex, tokenType: Text) : Bool {
    var tokenData = switch(_metadata.get(tokenId)) {
            case (?metadata) metadata.0.attributes[0].value == tokenType;
      case (_) return false;
  };

  return tokenData;
  };

  public shared(msg) func stakeNestInLand(nestTokenId: TokenIndex, landTokenId: TokenIndex ) : async Result.Result<Text, Text> {
    if(checkTypeToken(nestTokenId, "Nest") == true and checkTypeToken(landTokenId, "Land") == true) {
      if(_isOwnerOf(nestTokenId, Principal.toText(msg.caller)) == true and _isOwnerOf(landTokenId, Principal.toText(msg.caller)) == true) {
        var tokenData = switch(_metadata.get(landTokenId)) {
      case (?metadata)  {
        var newDetail: DetailNFT = metadata.0.detail;
        switch (metadata.0.detail) {
          case (#land(n)) {
            newDetail := #land({resource = n.resource;  claimableResource = n.claimableResource; nestStaked=?nestTokenId;info=n.info;inKingdom = n.inKingdom;});
          };
          case (_) {

          };
        };
     
        metadata.0.detail := newDetail;
         _metadata.put(landTokenId,metadata);
         };
      case (_) return #err("Token not valid!");
  };

   var nestData = switch(_metadata.get(nestTokenId)) {
      case (?metadata)  {
        var newDetail: DetailNFT = metadata.0.detail;
        switch (metadata.0.detail) {
          case (#nest(n)) {
            newDetail := #nest({level=n.level; inLand= ?landTokenId;queenIn= n.queenIn; limit = n.limit});
              switch (users.get(Principal.toText(msg.caller))) {
                  case (?user) {
                    let userRes  = user.userState.resource;
                    let userLimit = user.userState.limitAnt;
                    user.userState := {kingdomId=user.userState.kingdomId;
                    resource = user.userState.resource; 
                    limitAnt= userLimit + n.limit;currentAnt=user.userState.currentAnt};
                    users.put(Principal.toText(msg.caller), user);
                  };
         
                  case (_) {
                    return #err("User Not Found")
                  };
                };
          };
          case (_) {

          };
        };
     
        metadata.0.detail := newDetail;
         _metadata.put(nestTokenId,metadata);
         };
      case (_) return #err("Token not valid!");
  };
  
        return #ok("ok");
    } else {
       return #err("Token Staked!");
    };
    } else {
      return #err("Token not valid!");
    };
  };

  public shared(msg) func stakeQueenInNest(queenTokenId: TokenIndex,  nestTokenId: TokenIndex ) : async Result.Result<Text, Text> {
    if(checkTypeToken(nestTokenId, "Nest") == true and checkTypeToken(queenTokenId,NFT_TYPE[0]) == true) {
      if(_isOwnerOf(nestTokenId, Principal.toText(msg.caller)) == true and _isOwnerOf(queenTokenId, Principal.toText(msg.caller)) == true) {
        var tokenData = switch(_metadata.get(queenTokenId)) {
          case (?metadata)  {
            var newDetail: DetailNFT = metadata.0.detail;
              switch (metadata.0.detail) {
                case (#queen(n)) {
                  newDetail := #queen({level=n.level; inNest = ?nestTokenId; info=n.info;breedingWorkerId=n.breedingWorkerId;});
                };
                case (_) {

                };
              };
     
            metadata.0.detail := newDetail;
            _metadata.put(queenTokenId,metadata);
          };
    
          case (_) return #err("Token not valid!");
        };
        var nestData = switch(_metadata.get(nestTokenId)) {
          case (?metadata)  {
            var newDetail: DetailNFT = metadata.0.detail;
            switch (metadata.0.detail) {
              case (#nest(n)) {
                newDetail := #nest({level=n.level; inLand= n.inLand;queenIn= ?queenTokenId; limit= n.limit});
              };
              case (_) {
              };
            };
     
            metadata.0.detail := newDetail;
            _metadata.put(nestTokenId,metadata);
          };
          case (_) return #err("Token not valid!");
        };
        return #ok("ok");
      } else {
        return #err("Token Staked!");
      };
    } else {
      return #err("Token not valid!");
    };
  };
  
  private func registerToken(request: RegisterTokenRequest) : Nat32 {
    /*if (msg.caller != _admin) {
      let available = Cycles.available();
      if (available < CREATE_TOKEN_FEE) {        
        return #err("Please send the correct amount of cycles to create your new token");
      };
      ignore(Cycles.accept(available));
    };*/
   
    let tokenId : TokenIndex = _nextTokenId;
    let dataNft : Metadata = {
      var name =  request.metadata.name # " #" # Nat32.toText(tokenId);
      var description = request.metadata.description # " #" # Nat32.toText(tokenId);
      var image = request.metadata.image;
      var attributes: [AttributeMeta] = request.metadata.attributes;
      var detail: DetailNFT = request.metadata.detail;
      var tokenId: TokenIndex = tokenId;
    };
    let ledger = HashMap.HashMap<AccountIdentifier, Balance>(1, AID.equal, AID.hash);
    ledger.put(request.owner, request.supply);
    _registry.put(tokenId, ledger);
    _addTokenTo(request.owner, tokenId);
    _metadata.put(tokenId, (dataNft, request.supply));
    _nextTokenId := _nextTokenId + 1;
    return tokenId;
  };

  
  public shared(msg) func createOrder(_tokenId: TokenIndex, _price: Nat) {
        var owner: Principal = switch (_isOwnerOf(_tokenId,  Principal.toText(msg.caller))) {
            case (?own) {
                own;
            };
            case (_) {
                return #Err(#TokenNotExist)
            };
        };
        if(owner != msg.caller) {
            return #Err(#Unauthorized);
        };

        var order: OrderInfo = {
            index = totalOrders_;
            owner = msg.caller;
            var price = _price;
            tokenId = _tokenId;
        }
        orders.put(totalOrders_, order);
        totalOrders_ +=1;
        return #Ok(txid);

    };

    
    public shared(msg) func buy(amount: Nat): async Result.Result<Nat, Text> {
        let info = switch(saleInfo) {
            case(?i) { i };
            case(_) { return #err("not in sale"); };
        };
        if(Time.now() < info.startTime or Time.now() > info.endTime) return #err("sale not started or already ended");
        let userBalance = _balanceOf(msg.caller);
        if(amount < info.minPerUser or userBalance + amount > info.maxPerUser) return #err("amount error");
        let tokenActor: TokenActor = actor(Principal.toText(info.paymentToken));
        switch(await tokenActor.transferFrom(msg.caller, Principal.fromActor(this), amount * info.price)) {
            case(#Ok(id)) {
                ignore _batchMint(msg.caller, amount);
                info.amountLeft -= amount;
                info.fundRaised += amount * info.price;
                saleInfo := ?info;
                return #ok(amount);
            };
            case(#Err(e)) {
                return #err("payment failed");
            };
        };
    };

  private func _addTokenTo(to: Text, tokenId: TokenIndex) {
    switch(users.get(to)) {
      case (?user) {
        user.tokens := TrieSet.put(user.tokens, tokenId, Hash.hash(Nat32.toNat(tokenId)), Nat32.equal);
        users.put(to, user);
      };
      case _ {
        let user = _newUser();
        user.tokens := TrieSet.put(user.tokens, tokenId, Hash.hash(Nat32.toNat(tokenId)), Nat32.equal);
        users.put(to, user);
      };
    }
  }; 

  public query func getUserTokens(owner: AccountIdentifier) : async Result.Result<[MetadataExt] , CommonError>{
    let tokenIds = switch (users.get(owner)) {
      case (?user) {
        TrieSet.toArray(user.tokens)
      };
      case _ {
        []
      };
    };
    let ret = Buffer.Buffer<MetadataExt>(tokenIds.size());
    for(id in Iter.fromArray(tokenIds)) {
      var tokenData = switch(_metadata.get(id)) {
        case (?metadata) metadata;
        case (_) return #err(#InvalidToken(Nat32.toText(id)));
      };
      ret.add(_tokenMetadata(tokenData.0));
    };
    return  #ok(ret.toArray());
  };

  public query func getUserAvailableWorker(owner: AccountIdentifier) : async Result.Result<[MetadataExt] , CommonError>{
    let tokenIds = switch (users.get(owner)) {
      case (?user) {
        TrieSet.toArray(user.tokens)
      };
      case _ {
        []
      };
    };
    let ret = Buffer.Buffer<MetadataExt>(tokenIds.size());
    for(id in Iter.fromArray(tokenIds)) {
      var tokenData = switch(_metadata.get(id)) {
        case (?metadata) {
          switch (metadata.0.detail) {
            case (#worker(w)) {
              if(Nat.equal(w.antState, ANT_STATE[0])) {
                ret.add(_tokenMetadata(metadata.0));
              };
            };
            case (_) {
            };
          };
        };
        case (_) return #err(#InvalidToken(Nat32.toText(id)));
      };
    };

    return  #ok(ret.toArray());

  };


  private func _newUser() : UserInfo {
    {
      var id = "";
      var name = "";
      var tokens = TrieSet.empty<TokenIndex>();
      var userState : UserState = {resource = {soil=0; leaf= 0; gold=0;food=0;}; limitAnt = 0;kingdomId=0;currentAnt=0;};
    }
  };

  public shared(msg) func updateUser(userName : Text) : async Result.Result<Nat , CommonError> {
    switch(users.get(Principal.toText(msg.caller))) {
      case (?user) {
        user.name := userName;
        users.put(Principal.toText(msg.caller), user);
      };
      case (_) {
        D.print("False")
      };
    };

    return #ok(1);
  };


  public shared(msg) func workerFarmInLand(workerTokenIds: WorkerFarmRequest, landTokenId: TokenIndex): async Result.Result<Bool , Text> {
    let claimResource = newResource();
    let ret = Buffer.Buffer<TokenIndex>(workerTokenIds.countIds);
      for(id in Iter.fromArray(workerTokenIds.soil)) {
        if(_isOwnerOf(id, Principal.toText(msg.caller)) == false) return #err("Token owner not valid!");
        var tokenData = switch(_metadata.get(id)) {
          case (?metadata)  {
            var newDetail: DetailNFT = metadata.0.detail;
            switch (metadata.0.detail) {
              case (#worker(w)) {
                if(Nat.equal(w.antState, ANT_STATE[0])) {
                  ret.add(id);
                  newDetail := #worker({ inNest= w.inNest;queenId= w.queenId; antState=ANT_STATE[2];breedTimestamp= w.breedTimestamp;farmTimestamp=Time.now()+w.info.farmingTime;info=w.info});
                  claimResource.soil += w.info.farmPerTime.soil;
                } else {
                }
              };
              case (_) {
              };
            };
          
            metadata.0.detail := newDetail;
            _metadata.put(id,metadata);
          };
        
          case (_) return #err("Token soil not valid!");
        };
      };

      for(id in Iter.fromArray(workerTokenIds.leaf)) {
        if(_isOwnerOf(id, Principal.toText(msg.caller)) == false) return #err("Token not valid!");
        var tokenData = switch(_metadata.get(id)) {
          case (?metadata)  {
            var newDetail: DetailNFT = metadata.0.detail;
            switch (metadata.0.detail) {
              case (#worker(w)) {
                if(Nat.equal(w.antState, ANT_STATE[0])) {
                  ret.add(id);
                  newDetail := #worker({inNest= w.inNest;queenId= w.queenId; antState=ANT_STATE[2];breedTimestamp= w.breedTimestamp;farmTimestamp=Time.now()+w.info.farmingTime;info=w.info});
                  claimResource.leaf += w.info.farmPerTime.leaf;
                } else {
                }
              };
              case (_) {
              };
            };
        
            metadata.0.detail := newDetail;
            _metadata.put(id,metadata);
          };
        
          case (_) return #err("Token leaf not valid!");
        };
      };

      for(id in Iter.fromArray(workerTokenIds.food)) {
        if(_isOwnerOf(id, Principal.toText(msg.caller)) == false) return #err("Token food ow not valid!");
        var tokenData = switch(_metadata.get(id)) {
          case (?metadata)  {
            var newDetail: DetailNFT = metadata.0.detail;
            switch (metadata.0.detail) {
              case (#worker(w)) {
                if(Nat.equal(w.antState, ANT_STATE[0])) {
                  ret.add(id);
                  newDetail := #worker({ inNest= w.inNest;queenId= w.queenId; antState=ANT_STATE[2];breedTimestamp= w.breedTimestamp;farmTimestamp=Time.now()+w.info.farmingTime;info=w.info});
                  claimResource.food += w.info.farmPerTime.food;
                } else {
                }
              };
              case (_) {
              };
            };
        
            metadata.0.detail := newDetail;
            _metadata.put(id,metadata);
          };
        
          case (_) return #err("Token food not valid!");
        };
      };

      for(id in Iter.fromArray(workerTokenIds.gold)) {
        if(_isOwnerOf(id, Principal.toText(msg.caller)) == false) return #err("Token not valid!");
        var tokenData = switch(_metadata.get(id)) {
          case (?metadata)  {
            var newDetail: DetailNFT = metadata.0.detail;
            switch (metadata.0.detail) {
              case (#worker(w)) {
                if(Nat.equal(w.antState, ANT_STATE[0])) {
                  ret.add(id);
                  newDetail := #worker({inNest= w.inNest;queenId= w.queenId; antState=ANT_STATE[2];breedTimestamp= w.breedTimestamp;farmTimestamp=Time.now()+w.info.farmingTime;info=w.info});
                  claimResource.gold += w.info.farmPerTime.gold;
                } else {
                }
              };
              case (_) {
              };
            };
        
            metadata.0.detail := newDetail;
            _metadata.put(id,metadata);
          };
        
          case (_) return #err("Token gold not valid!");
        };
      };

      if(_isOwnerOf(landTokenId, Principal.toText(msg.caller)) == false) return #err("Token land ow not valid!");
      var tokenData = switch(_metadata.get(landTokenId)) {
        case (?metadata)  {
          var newDetail: DetailNFT = metadata.0.detail;
          switch (metadata.0.detail) {
            case (#land(w)) {
              let claimableResource = {
                resource = {soil= claimResource.soil;leaf=claimResource.leaf;
                gold=claimResource.gold;food=claimResource.food;};
                id = _nextFarmId; 
                claimTimeStamp=Time.now() + w.info.farmingTime;
                workersFarmIds = ret.toArray();
              };
              newDetail := #land({
                nestStaked=w.nestStaked;
                resource = w.resource;
                claimableResource = Array.append(w.claimableResource, [claimableResource]);
                info = w.info;
                inKingdom = w.inKingdom;
              });
            };
            case (_) {
            };
          };
        
          metadata.0.detail := newDetail;
          _metadata.put(landTokenId,metadata);
          _nextFarmId+=1;
        };
        
        case (_) return #err("Token Land not valid!");
      };

      return #ok(true)
  };

  public shared(msg) func claimResourceInLand(landTokenId: TokenIndex, farmId: TokenIndex): async Result.Result<Bool, Text>{
    if(_isOwnerOf(landTokenId, Principal.toText(msg.caller)) == false) return #err("Token not valid!");
    var tokenData = switch(_metadata.get(landTokenId)) {
      case (?metadata)  {
        var newDetailLand: DetailNFT = metadata.0.detail;
          switch (metadata.0.detail) {
            case (#land(w)) {
              let iterArr = Iter.fromArray(w.claimableResource);
              var order =0;
              var farmSelected =0;
              let ret = Buffer.Buffer<Types.ClaimResouceInfo>(Iter.size(iterArr));
              for(farm in Iter.fromArray(w.claimableResource)) {
                order+=1;
                if(farm.id == farmId) {
                  if(Int.lessOrEqual(farm.claimTimeStamp , Time.now()) ){
                    farmSelected := order;
                  } else {
                    return #err("Not Claim Time!")
                  }
                } else {
                     ret.add(farm);
                };
              };
              if(farmSelected != 0) {
                let farm = w.claimableResource[farmSelected -1];
                newDetailLand := #land({
                  nestStaked=w.nestStaked;
                  resource = {soil= w.resource.soil - farm.resource.soil;leaf= w.resource.leaf - farm.resource.leaf;
                  gold= w.resource.gold - farm.resource.gold;food=w.resource.food - farm.resource.food;};
                  claimableResource = ret.toArray();
                  info=w.info;
                  inKingdom = w.inKingdom;
                });

                switch (users.get(Principal.toText(msg.caller))) {
                  case (?user) {
                    let userRes  = user.userState.resource;
                    let userLimit = user.userState.limitAnt;
                    user.userState := {kingdomId=user.userState.kingdomId;
                    resource = {soil=userRes.soil + farm.resource.soil; leaf= userRes.leaf + farm.resource.leaf; gold=userRes.gold + farm.resource.gold;food= userRes.food + farm.resource.food;}; 
                    limitAnt= userLimit;currentAnt=user.userState.currentAnt};
                    users.put(Principal.toText(msg.caller), user);
                  };
         
                  case (_) {
                    return #err("User Not Found")
                  };
                };
                for(id in Iter.fromArray(farm.workersFarmIds)) {
                  if(_isOwnerOf(id, Principal.toText(msg.caller)) == false) return #err("Token not valid!");
                  var tokenData = switch(_metadata.get(id)) {
                    case (?metadata)  {
                      var newDetail: DetailNFT = metadata.0.detail;
                      switch (metadata.0.detail) {
                        case (#worker(w)) {
                          if(Nat.equal(w.antState, ANT_STATE[2])) {
                            newDetail := #worker({ inNest= w.inNest;queenId= w.queenId; antState=ANT_STATE[0];breedTimestamp= w.breedTimestamp;farmTimestamp=w.farmTimestamp;info=w.info});
                          } else {
                          }
                        };
                        case (_) {
                        };
                      };
        
                      metadata.0.detail := newDetail;
                      _metadata.put(id,metadata);
                    };
        
                    case (_) return #err("Token not valid!");
                  };
                };
              } else {
                 return #err("farm not found!");
               };
            };
            case (_) {
            };
          };
        
          metadata.0.detail := newDetailLand;
          _metadata.put(landTokenId,metadata);
      };
        
      case (_) return #err("Token not valid!");
    };
    return #ok(true)
  };

  public shared(msg) func upgradeLevelQueen(queenTokenId: TokenIndex): async Result.Result<MetadataExt, Text>  {
     if(checkTypeToken(queenTokenId,NFT_TYPE[0]) == true and _isOwnerOf(queenTokenId, Principal.toText(msg.caller)) == true) {
        var tokenData = switch(_metadata.get(queenTokenId)) {
      case (?metadata)  {
        var newDetail: DetailNFT = metadata.0.detail;
        switch (metadata.0.detail) {
          case (#queen(n)) {
            let levelInfo = getLevelInfoByAnt(NFT_TYPE[0], NFT_RARITY[0], n.level-1);
              switch(levelInfo) {
                      case (?info) {
                        var isUpdate = updateUserResource(Principal.toText(msg.caller), info.costResource); 
                        if(isUpdate == true) {
                            switch (info.nextLevel) {
                              case (#queen(nextLevel)) {
                                 newDetail := #queen({level=n.level +1 ; inNest = n.inNest; info={resourcePerWorker=nextLevel.resourcePerWorker;breedWorkerTime=nextLevel.breedWorkerTime;};breedingWorkerId=n.breedingWorkerId;});
                              };
                                case (_) {

                            };
                          };
                        
                        } else {
                        return #err("not enough resource!")
                      };
     
                      };
                    case _ {
                      return #err("no ant detail found!")
                    };
                  };
              };
              case (_) {

              };
            };
     
            metadata.0.detail := newDetail;
            _metadata.put(queenTokenId,metadata);
            return #ok(_tokenMetadata(metadata.0));
          };
    
          case (_) return #err("Token not valid!");
        };
      };
    return #err("failed")
  };

  public shared(msg) func upgradeLevelNest(nestTokenId: TokenIndex): async Result.Result<MetadataExt, Text>  {
    if(checkTypeToken(nestTokenId,NFT_TYPE[0]) == true and _isOwnerOf(nestTokenId, Principal.toText(msg.caller)) == true) {
      var tokenData = switch(_metadata.get(nestTokenId)) {
        case (?metadata)  {
          var newDetail: DetailNFT = metadata.0.detail;
          switch (metadata.0.detail) {
            case (#nest(n)) {
              let levelInfo = getLevelInfoByAnt(NFT_TYPE[2], metadata.0.attributes[1].value, n.level-1);
                switch(levelInfo) {
                  case (?info) {
                    var isUpdate = updateUserResource(Principal.toText(msg.caller), info.costResource); 
                    if(isUpdate == true) {
                      switch (info.nextLevel) {
                        case (#nest(nextLevel)) {
                          newDetail := #nest({level=n.level +1 ;inLand= n.inLand;queenIn= n.queenIn; limit=nextLevel.limit;});
                        };
                        case (_) {
                        };
                      };
     
                    } else {
                      return #err("not enough resource!")
                    }
                  };
                  case _ {
                    return #err("no ant detail found!")
                  };
                };
            };
            case (_) {

            };
          };
     
          metadata.0.detail := newDetail;
          _metadata.put(nestTokenId,metadata);
          return #ok(_tokenMetadata(metadata.0));
        };
    
        case (_) return #err("Token not valid!");
      };
    };
    return #err("failed")
  };

  private func newResource(): Types.ResourceInt {
    return {
      var soil: Float=0; var leaf: Float= 0; var gold: Float=0; var food: Float = 0;
    }
  };

  private func updateUserResource(account: AccountIdentifier, resource: Resource): Bool {
    switch (users.get(account)) {
      case (?user) {
        let userRes  = user.userState.resource;
        if(userRes.food < resource.food or userRes.soil < resource.soil or userRes.leaf < resource.leaf or userRes.gold < resource.gold) {return false};
        user.userState := { kingdomId=user.userState.kingdomId;limitAnt=user.userState.limitAnt;currentAnt=user.userState.currentAnt;resource = {soil=userRes.soil - resource.soil ; leaf= userRes.leaf- resource.leaf ; gold=userRes.gold-resource.gold;food= userRes.food- resource.food;}};
        users.put(account, user);
        return true;
      };
         
      case (_) {
        return false
      };
    };
  };

  private func getLevelInfoByAnt(tokenType: Text, rarity: Text, level: Nat) : ?Types.CostInfo {
    for(metadata in Iter.fromArray(levelMetadata)) {
      if(metadata.name == tokenType) {
        for(info in Iter.fromArray(metadata.info)) {
          if(info.rarity == rarity) {
            return List.get(List.fromArray(info.info), level);
          };
        };
      };
    };
    return null;
  };

  //   private func _removeTokenFrom(owner: Principal, tokenId: Nat) {
  //       assert(_exists(tokenId) and _isOwner(owner, tokenId));
  //       switch(users.get(owner)) {
  //           case (?user) {
  //               user.tokens := TrieSet.delete(user.tokens, tokenId, Hash.hash(tokenId), Nat.equal);
  //               users.put(owner, user);
  //           };
  //           case _ {
  //               assert(false);
  //           };
  //       }
  //   };

  private func randomPercent(tokens: [Nat]): async  Nat {
    if(Iter.size(Iter.fromArray(tokens)) < 2) {
       return tokens[0]; 
    };
     let entropy = await Random.blob();
     let f = Random.Finite(entropy);
    var numberRandom:?Nat = f.range(100);
    switch (numberRandom) {
      case (?numberR) {
        let number = numberR % 100;
if(number < 40) {
      return tokens[0];
    } else if(number < 40+30) {
      return tokens[1];
    }else if(number < 40+30+15) {
      return tokens[2];
    }else if(number < 40+30+15 + 10) {
return tokens[3];
    }else  {
return tokens[4];
    };
      };
      case _ {
         return tokens[0];
      }
    };
  };
   

  public shared(msg) func claiming() : async Result.Result<Bool, Text> {
    D.print(Principal.toText(msg.caller));
       switch (users.get(Principal.toText(msg.caller))) {
            case (?user) {
              throw Error.reject("userClaimed");
            };
            case _ {
              var kingdomId: TokenIndex = 0;
                for(id in Iter.fromArray(NFT_CLAIMABLE)) {
                  let idRandom = await randomPercent(id);
                  D.print(Nat.toText(idRandom));
                 let request: RegisterTokenRequest = {
                  metadata = _unwrap(tokensMetadata.get(idRandom));
                    supply = 1;
                    owner = Principal.toText(msg.caller);
              };
              let tokenId = registerToken(request);
              if(kingdomId !=0) {
                kingdomId := tokenId;
              }
                };
                switch(users.get(Principal.toText(msg.caller))) {
            case (?user) {
                user.userState := {resource = {soil=500; leaf= 500; gold=50;food= 200;} ; limitAnt= user.userState.limitAnt;kingdomId=kingdomId;currentAnt=user.userState.currentAnt};
                users.put(Principal.toText(msg.caller), user);
            };
            case (_) {
               return #err("User Not Found")
            };
      };
              return #ok(true);
            };
        };        
  };

  public shared(msg) func stakeLandToKingdom(landTokenId: TokenIndex, kingdomTokenId: TokenIndex) : async Result.Result<Bool, Text> {
    if(checkTypeToken(landTokenId, NFT_TYPE[3]) == true and checkTypeToken(kingdomTokenId, NFT_TYPE[4]) == true) {
      if(_isOwnerOf(landTokenId, Principal.toText(msg.caller)) == true and _isOwnerOf(kingdomTokenId, Principal.toText(msg.caller)) == true) {
        var tokenData = switch(_metadata.get(landTokenId)) {
          case (?metadata)  {
            var newDetail: DetailNFT = metadata.0.detail;
            switch (metadata.0.detail) {
              case (#land(n)) {
                newDetail := #land({resource = n.resource;  claimableResource = n.claimableResource; nestStaked=n.nestStaked;info=n.info;inKingdom=kingdomTokenId});
              };
              case (_) {
              };
            };
     
            metadata.0.detail := newDetail;
            _metadata.put(landTokenId,metadata);
          };
          case (_) return #err("Token not valid!");
        };

        var nestData = switch(_metadata.get(kingdomTokenId)) {
          case (?metadata)  {
            var newDetail: DetailNFT = metadata.0.detail;
            switch (metadata.0.detail) {
              case (#kingdom(n)) {
                newDetail := #kingdom({landId = Array.append(n.landId, [landTokenId])});
              };
              case (_) {
              };
            };
     
            metadata.0.detail := newDetail;
            _metadata.put(kingdomTokenId,metadata);
          };
          case (_) return #err("Token not valid!");
        };
        switch (users.get(Principal.toText(msg.caller))) {
          case (?user) {
            if(user.userState.kingdomId==0) {
              user.userState := {resource = user.userState.resource; kingdomId= kingdomTokenId;limitAnt=user.userState.limitAnt;currentAnt=user.userState.currentAnt};
              users.put(Principal.toText(msg.caller), user);
            };    
          };
         
          case (_) {
            return #err("User Not Found")
          };
        };
  
        return #ok(true);
      } else {
        return #err("Token Staked!");
      };
    } else {
      return #err("Token not valid!");
    };
  };

  public shared(msg) func breedAntWorkder(queenTokenId: TokenIndex) : async Result.Result<Bool, Text> {  
    var tokenData = switch(_metadata.get(queenTokenId)) {
      case (?metadata)  {
        var newQueenDetail: DetailNFT = metadata.0.detail;
        switch (metadata.0.detail) {
          case (#queen(n)) {
                   if(n.breedingWorkerId!=0) {
              return #err("Queen is breeding!")
            };
            switch (users.get(Principal.toText(msg.caller))) {
              case (?user) {
                let userRes  = user.userState.resource;
                let userLimitAnt = user.userState.limitAnt;
                if(user.userState.currentAnt >= user.userState.limitAnt) {return #err("Limit not enough")};
                var isUpdate = updateUserResource(Principal.toText(msg.caller), n.info.resourcePerWorker); 
                if(isUpdate == false) {return #err("not enough food!")};
                user.userState := {kingdomId=user.userState.kingdomId;resource = user.userState.resource; limitAnt = userLimitAnt;currentAnt=user.userState.currentAnt+1};
                users.put(Principal.toText(msg.caller), user);
              };
         
              case (_) {
                return #err("User Not Found")
              };
            };
     
            let request: RegisterTokenRequest = {
              metadata = _unwrap(tokensMetadata.get(6));
              supply = 1;
              owner = Principal.toText(msg.caller);
            };
            let tokenId = registerToken(request);
            var workerData = switch(_metadata.get(tokenId)) {
              case (?metadata)  {
                var newWorkerDetail: DetailNFT = metadata.0.detail;
                switch (metadata.0.detail) {
                  case (#worker(w)) {
                    newWorkerDetail := #worker({ inNest= w.inNest;queenId= w.queenId; antState=ANT_STATE[1];breedTimestamp= Time.now()+ n.info.breedWorkerTime;farmTimestamp=w.farmTimestamp;info=w.info;});
                    newQueenDetail := #queen({level=n.level; inNest = n.inNest; info=n.info;breedingWorkerId=tokenId;});
                  };
                  case (_) {
                  };
                };
     
                metadata.0.detail := newWorkerDetail;
                _metadata.put(tokenId,metadata);
              };
              case (_) return #err("Token not valid!");
            };
          };
          case (_) {
          };
        };
     
        metadata.0.detail := newQueenDetail;
        _metadata.put(queenTokenId,metadata);
      };
    
      case (_) return #err("Token not valid!");
    };
    return #ok(true)
  };

  public shared(msg) func breedAntArmy(queenTokenId: TokenIndex) : async Result.Result<Bool, Text> {
    
    var tokenData = switch(_metadata.get(queenTokenId)) {
      case (?metadata)  {
        var newQueenDetail: DetailNFT = metadata.0.detail;
        switch (metadata.0.detail) {
          case (#queen(n)) {
              if(n.breedingWorkerId!=0) {
              return #err("Queen is breeding!")
            }; 
            switch (users.get(Principal.toText(msg.caller))) {
              case (?user) {
                let userRes  = user.userState.resource;
                let userLimitAnt = user.userState.limitAnt;
                if(user.userState.currentAnt > user.userState.limitAnt) {return #err("Limit not enough")};
                var isUpdate = updateUserResource(Principal.toText(msg.caller), n.info.resourcePerWorker); 
                if(isUpdate == false) {return #err("not enough food!")};
                user.userState := {kingdomId=user.userState.kingdomId;resource = user.userState.resource; limitAnt = userLimitAnt;currentAnt=user.userState.currentAnt+1};
                users.put(Principal.toText(msg.caller), user);
              };
         
              case (_) {
               return #err("User Not Found")
              };
            };
          
            let request: RegisterTokenRequest = {
                metadata = _unwrap(tokensMetadata.get(1));
                supply = 1;
                owner = Principal.toText(msg.caller);
            };
            let tokenId = registerToken(request);
            var workerData = switch(_metadata.get(tokenId)) {
              case (?metadata)  {
                var newWorkerDetail: DetailNFT = metadata.0.detail;
                switch (metadata.0.detail) {
                  case (#worker(w)) {
                    newWorkerDetail := #worker({ inNest= w.inNest;queenId= w.queenId; antState=ANT_STATE[1];breedTimestamp= Time.now()+ n.info.breedWorkerTime;farmTimestamp=w.farmTimestamp;info=w.info;});
                    newQueenDetail := #queen({level=n.level; inNest = n.inNest; info=n.info;breedingWorkerId=tokenId;});
                  };
                  case (_) {
                  };
                };

                metadata.0.detail := newWorkerDetail;
                _metadata.put(tokenId,metadata);
              };
              case (_) return #err("Token not valid!");
            };
          };
          case (_) {
          };
        };
     
        metadata.0.detail := newQueenDetail;
        _metadata.put(queenTokenId,metadata);
      };
    
      case (_) return #err("Token not valid!");
    };
    return #ok(true)
  };

  public shared(msg) func claimWorkerEgg(queenTokenId: TokenIndex): async Result.Result<Bool, Text> {
    var tokenData = switch(_metadata.get(queenTokenId)) {
      case (?metadataOfQueen) {
        var newQueenDetail: DetailNFT = metadataOfQueen.0.detail;
        switch (metadataOfQueen.0.detail) {
          case (#queen(n)) {
             if(n.breedingWorkerId==0) {
              return #err("Queen is not breeding!")
            }; 
            let tokenId = n.breedingWorkerId;
            var workerData = switch(_metadata.get(tokenId)) {
              case (?metadata)  {
                var newWorkerDetail: DetailNFT = metadata.0.detail;
                switch (metadata.0.detail) {
                  case (#worker(w)) {
                    D.print(Int.toText(Time.now()) # "   " # Int.toText(w.breedTimestamp));
                    if(w.breedTimestamp > Time.now()) {
                      return #err("Can't claim!");
                    } else {
                      newWorkerDetail := #worker({ inNest= n.inNest;queenId= ?queenTokenId; antState=ANT_STATE[0];breedTimestamp= w.breedTimestamp;farmTimestamp=w.farmTimestamp;info=w.info;});
                      newQueenDetail := #queen({level=n.level; inNest = n.inNest; info=n.info;breedingWorkerId=0;});
                    };
                  };
                  case (_) {
                  };
                };
     
                metadata.0.detail := newWorkerDetail;
                _metadata.put(tokenId,metadata);
              };
              case (_) return #err("Token not valid!");
            };
          };
          case (_) {
          };
        };
     
        metadataOfQueen.0.detail := newQueenDetail;
         _metadata.put(queenTokenId,metadataOfQueen);
      };
    
      case (_) return #err("Token not valid!");
    };
    return #ok(true)
  };

  public query func getUserInfo(who: AccountIdentifier) : async UserInfoExt {
    switch (users.get(who)) {
      case (?user) {
        return _userInfotoExt(user)
      };
      case _ {
        throw Error.reject("userNotExist");
      };
    };        
  };

  private func _userInfotoExt(info: UserInfo) : UserInfoExt {
    return {
      name = info.name;
      id = info.id;
      tokens = TrieSet.toArray(info.tokens);
      userState = info.userState;
    };
  };

  private func _unwrap<T>(x : ?T) : T =
    switch x {
      case null { Prelude.unreachable() };
      case (?x_) { x_ };
    };
  
  public shared(msg) func transfer(request: TransferRequest) : async TransferResponse {
    if (ExtCore.TokenIdentifier.isPrincipal(request.token, Principal.fromActor(this)) == false) {
			return #err(#InvalidToken(request.token));
		};
    let tokenIndex = ExtCore.TokenIdentifier.getIndex(request.token);
    var tokenBalances = switch(_registry.get(tokenIndex)) {
      case (?balances) balances;
      case (_) return #err(#InvalidToken(request.token));
    };
    
    let sender = ExtCore.User.toAID(request.from);
    let spender = AID.fromPrincipal(msg.caller, request.subaccount);
    let receiver = ExtCore.User.toAID(request.to);
    if (AID.equal(sender, spender) == false) {
      return #err(#Unauthorized(spender));
    };
    
    switch (tokenBalances.get(sender)) {
      case (?sender_balance) {
        if (sender_balance >= request.amount) {
          //Remove from sender first
          var sender_balance_new : Balance = sender_balance - request.amount;
          tokenBalances.put(sender, sender_balance_new);
          
          var provisional_amount : Balance = request.amount;
          var receiver_balance_new = switch (tokenBalances.get(receiver)) {
            case (?receiver_balance) {
              receiver_balance + provisional_amount;
            };
            case (_) {
                provisional_amount;
            };
          };
          if (request.notify) {
            switch(ExtCore.User.toPrincipal(request.to)) {
              case (?canisterId) {
                let notifier : NotifyService = actor(Principal.toText(canisterId));
                switch(await notifier.tokenTransferNotification(request.token, request.from, request.amount, request.memo)) {
                  //Refresh token balances after an await
                  case (?balance) {
                    provisional_amount := balance;
                    tokenBalances := switch(_registry.get(tokenIndex)) {
                      case (?balances) balances;
                      case (_) return #err(#Other("Token was deleted during transfer..."));
                    };
                    assert(provisional_amount <= request.amount);
                    receiver_balance_new := switch (tokenBalances.get(receiver)) {
                      case (?receiver_balance) {
                          receiver_balance + provisional_amount;
                      };
                      case (_) {
                          provisional_amount;
                      };
                    };
                  };
                  case (_) {
                    tokenBalances := switch(_registry.get(tokenIndex)) {
                      case (?balances) balances;
                      case (_) return #err(#Other("Token was deleted during transfer..."));
                    };
                    var sender_balance_new2 = switch (tokenBalances.get(sender)) {
                      case (?sender_balance) {
                          sender_balance + request.amount;
                      };
                      case (_) {
                          request.amount;
                      };
                    };
                    tokenBalances.put(sender, sender_balance_new2);
                    return #err(#Rejected);
                  };
                };
              };
              case (_) {
                tokenBalances.put(sender, sender_balance);
                return #err(#CannotNotify(receiver));
              }
            };
          };
          tokenBalances.put(receiver, receiver_balance_new);
          
          //Process sender refund
          if (provisional_amount < request.amount) {
            var sender_refund : Balance = request.amount - provisional_amount;
            var sender_balance_new2 = switch (tokenBalances.get(sender)) {
              case (?sender_balance) {
                  sender_balance + sender_refund;
              };
              case (_) {
                  sender_refund;
              };
            };
            tokenBalances.put(sender, sender_balance_new2);
          };
          
          //Update registry
          _registry.put(tokenIndex, tokenBalances);
          return #ok(provisional_amount);
        } else {
          return #err(#InsufficientBalance);
        };
      };
      case (_) {
        return #err(#InsufficientBalance);
      };
    };
  };

  public query func extensions() : async [Extension] {
    EXTENSIONS;
  };
  
  public query func balance(request : BalanceRequest) : async BalanceResponse {
    if (ExtCore.TokenIdentifier.isPrincipal(request.token, Principal.fromActor(this)) == false) {
			return #err(#InvalidToken(request.token));
		};
    let tokenIndex = ExtCore.TokenIdentifier.getIndex(request.token);
    var tokenBalances = switch(_registry.get(tokenIndex)) {
      case (?balances) balances;
      case (_) return #err(#InvalidToken(request.token));
    };
    let aid = ExtCore.User.toAID(request.user);
    switch (tokenBalances.get(aid)) {
      case (?balance) {
        return #ok(balance);
      };
      case (_) {
        return #ok(0);
      };
    }
  };
  
  public query func numberOfTokenHolders(token : TokenIdentifier) : async Result.Result<Nat, CommonError> {
    if (ExtCore.TokenIdentifier.isPrincipal(token, Principal.fromActor(this)) == false) {
			return #err(#InvalidToken(token));
		};
    let tokenIndex = ExtCore.TokenIdentifier.getIndex(token);
    var tokenBalances = switch(_registry.get(tokenIndex)) {
      case (?balances) balances;
      case (_) return #err(#InvalidToken(token));
    };
    return #ok(Iter.size(tokenBalances.entries()));
  };
  
  public query func numberOfTokens() : async Nat {
    return Iter.size(_registry.entries());
  };

  public query func supply(token : TokenIdentifier) : async Result.Result<Balance, CommonError> {
    if (ExtCore.TokenIdentifier.isPrincipal(token, Principal.fromActor(this)) == false) {
			return #err(#InvalidToken(token));
		};
    let tokenIndex = ExtCore.TokenIdentifier.getIndex(token);
    var tokenData = switch(_metadata.get(tokenIndex)) {
      case (?metadata) metadata;
      case (_) return #err(#InvalidToken(token));
    };
    #ok(tokenData.1);
  };

  public query func metadata(token : TokenIdentifier) : async Result.Result<MetadataExt, CommonError> {
    if (ExtCore.TokenIdentifier.isPrincipal(token, Principal.fromActor(this)) == false) {
			return #err(#InvalidToken(token));
		};
    let tokenIndex = ExtCore.TokenIdentifier.getIndex(token);
    var tokenData = switch(_metadata.get(tokenIndex)) {
      case (?metadata) metadata;
      case (_) return #err(#InvalidToken(token));
    };
    #ok(_tokenMetadata(tokenData.0));
  };

  public query func registry(token : TokenIdentifier) : async Result.Result<[(AccountIdentifier, Balance)], CommonError> {
    if (ExtCore.TokenIdentifier.isPrincipal(token, Principal.fromActor(this)) == false) {
			return #err(#InvalidToken(token));
		};
    let tokenIndex = ExtCore.TokenIdentifier.getIndex(token);
    var tokenBalances = switch(_registry.get(tokenIndex)) {
      case (?balances) balances;
      case (_) return #err(#InvalidToken(token));
    };
    return #ok(Iter.toArray(tokenBalances.entries()));
  };
  
  // public query func allMetadata() : async [(TokenIndex, (MetadataExt, Balance))] {
  //   Iter.toArray(_metadata.entries());
  // };
  
  public query func allRegistry() : async [(TokenIndex, [(AccountIdentifier, Balance)])] {
    var ret : [(TokenIndex, [(AccountIdentifier, Balance)])] = [];
    Iter.iterate(_registry.entries(), func(x : (TokenIndex, TokenLedger), _index : Nat) {
      ret := Array.append(ret, [(x.0, Iter.toArray(x.1.entries()))]);
    });
    ret;
  };
  
  
  //Internal cycle management - good general case
  public func acceptCycles() : async () {
    let available = Cycles.available();
    let accepted = Cycles.accept(available);
    assert (accepted == available);
  };
  
  public query func availableCycles() : async Nat {
    return Cycles.balance();
  };


  public shared(msg) func getDataByLandId(landTokenId : TokenIndex) : async Result.Result<[MetadataExt], Text> {
    let ret = Buffer.Buffer<MetadataExt>(3);
    
    if(checkTypeToken(landTokenId, "Land")) {
      if(_isOwnerOf(landTokenId, Principal.toText(msg.caller))) {
       switch (_metadata.get(landTokenId)) {
         case (?metadataLand) {
            ret.add(_tokenMetadata(metadataLand.0));

            switch(metadataLand.0.detail) {
              case (#land(n)) {
                switch (n.nestStaked) {
                  case (?nestStaked) {
                    switch (_metadata.get(nestStaked)) {
                      case (?metadataNest) {
                        ret.add(_tokenMetadata(metadataNest.0));

                        switch (metadataNest.0.detail) {
                          case (#nest(n)) {
                              switch(n.inLand) {
                                case (?inland) {
                                  switch(_metadata.get(inland)) {
                                    case (?metadataQueen) {
                                       ret.add(_tokenMetadata(metadataQueen.0));
                                    };

                                    case (_) {
                                      D.print("Don't have tokenId of this Queen");
                                    };
                                  };
                                };
                                case (_) {
                                      D.print("Don't have inLand of Nest");
                                };
                              };
                          };
                          case (_) {
                            D.print("Don't have tokenId of this Queen");
                          };
                      
                        };
                    
                      };
                      case (_) {
                        D.print("Don't have Nest with this NestID");
                      };
                    };
                  };
                  case (_) {
                        D.print("Don't have NestStaked in Land");
                  };
                }
                
              };

              case (_) {
                D.print("Do not have detail of Land");
              };
            };
          };
          case (_) {
            D.print("Do not have Land with this LandId");
          };
        };

      };
      return #ok(ret.toArray());
    };
    return #err("land Id is not correct");
  };

};
