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

    mapping(uint => Policy) public policies;
    uint public policyCounter;

    // Event to log policy creation
    event PolicyCreated(uint policyId, address policyHolder, uint coverageAmount, uint premium);

    // Event to log the result of viewing a policy
    event PolicyViewed(uint policyId, address policyHolder, uint coverageAmount, uint premium, bool isActive);

    // Function to create a new policy
    function createPolicy(address _policyHolder, uint _coverageAmount, uint _premium) public returns (uint) {
        policyCounter++;
        policies[policyCounter] = Policy(policyCounter, _policyHolder, _coverageAmount, _premium, true);
        
        // Emit event after creating the policy
        emit PolicyCreated(policyCounter, _policyHolder, _coverageAmount, _premium);

        return policyCounter;
    }

    // Function to view a policy (no longer view-only since it emits events)
    function viewPolicy(uint _policyId) public returns (Policy memory) {
        // Ensure the policy exists
        require(_policyId > 0 && _policyId <= policyCounter, "Policy does not exist");

        // Emit event for viewing the policy (for debugging)
        emit PolicyViewed(
            _policyId,
            policies[_policyId].policyHolder,
            policies[_policyId].coverageAmount,
            policies[_policyId].premium,
            policies[_policyId].isActive
        );

        return policies[_policyId];
    }
}
