import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";

//type HashMap<K, V> = HashMap.HashMap<K, V>;

actor {
  stable var orgname : Text = "org";
  stable var orgmotto : Text = "motto";
  var proposals = HashMap.HashMap<Nat, Proposal>(1, Nat.equal, Hash.hash);
  stable var proposalIdCount : Nat = 0;

  public type Proposal = {
    element: Text;
    value : Text;
    votes : Nat;
  };

  public query func get_orgname() : async Text {
    orgname;
  };

  public query func get_orgmotto() : async Text {
    orgmotto;
  };

  public func submit_proposal(element : Text, value : Text, votes : Nat) : async () {

    proposalIdCount += 1;
    let id : Nat = proposalIdCount;

    let proposal = {  element = element;
                      value = value;
                      votes = 0};

    proposals.put(id, proposal);
  };

  public query func get_proposals() : async [(Nat, Proposal)] {
    let proposalsIter : Iter.Iter<(Nat, Proposal)> = proposals.entries();

    let proposalsArray : [(Nat, Proposal)] = Iter.toArray(proposalsIter);

    proposalsArray;
  };

};
