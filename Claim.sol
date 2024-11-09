// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsurancePolicy {
    struct Policy {
        uint policyId;
        address policyHolder;
        uint coverageAmount;
        uint premium;
        bool isActive;
    }

    struct Claim {
        uint claimId;
        uint policyId;
        uint claimAmount;
        bool isApproved;
    }

    mapping(uint => Policy) public policies;
    mapping(uint => Claim) public claims;
    
    uint public policyCounter;
    uint public claimCounter;

    // Function to create a new insurance policy
    function createPolicy(address _policyHolder, uint _coverageAmount, uint _premium) public returns (uint) {
        policyCounter++;
        policies[policyCounter] = Policy(policyCounter, _policyHolder, _coverageAmount, _premium, true);
        return policyCounter; // Return the policyId to the user
    }

    // Function to view a policy by ID
    function viewPolicy(uint _policyId) public view returns (uint, address, uint, uint, bool) {
        Policy memory policy = policies[_policyId];
        return (policy.policyId, policy.policyHolder, policy.coverageAmount, policy.premium, policy.isActive);
    }

    // Function to submit a claim linked to a policy
    function submitClaim(uint _policyId, uint _claimAmount) public returns (uint) {
        claimCounter++;
        claims[claimCounter] = Claim(claimCounter, _policyId, _claimAmount, false);
        return claimCounter; // Return the claimId to the user
    }

    // Function to approve a claim
    function approveClaim(uint _claimId) public {
        claims[_claimId].isApproved = true;
    }
}
