// Handle login functionality
document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault();
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;

    if (username && password) {
        alert(`Logged in as ${username}`);
        // Redirect to claim submission or dashboard
        window.location.href = "#submitClaim";
    } else {
        alert("Please enter a valid username and password.");
    }
});

// Handle claim submission with file upload progress
document.getElementById("claimForm").addEventListener("submit", function(event) {
    event.preventDefault();

    let claimantName = document.getElementById("claimantName").value;
    let claimAmount = document.getElementById("claimAmount").value;
    let claimDescription = document.getElementById("claimDescription").value;
    let documentUpload = document.getElementById("documentUpload").files[0];

    if (claimantName && claimAmount && claimDescription && documentUpload) {
        // Simulate upload progress
        let progressBar = document.getElementById("uploadProgress");
        let progress = 0;
        let progressInterval = setInterval(function() {
            progress += 10;
            progressBar.innerHTML = `<div style="width: ${progress}%"></div>`;
            if (progress === 100) {
                clearInterval(progressInterval);
                alert("Claim submitted successfully!");
                // Reset the form
                document.getElementById("claimForm").reset();
            }
        }, 500);
    } else {
        alert("Please fill in all fields and upload a document.");
    }
});

// Display claim history (simulate with static data)
let claimHistory = [
    { claimId: "12345", claimantName: "John Doe", claimAmount: "$5000", status: "Approved" },
    { claimId: "67890", claimantName: "Jane Smith", claimAmount: "$2000", status: "Pending" },
    { claimId: "11223", claimantName: "George Brown", claimAmount: "$1500", status: "Rejected" }
];

// Function to display claim history
function displayClaimHistory() {
    let claimHistoryDiv = document.getElementById("claimList");
    claimHistoryDiv.innerHTML = "";  // Clear the previous history

    claimHistory.forEach(claim => {
        let claimDiv = document.createElement("div");
        claimDiv.classList.add("claim-item");
        
        claimDiv.innerHTML = `
            <h3>Claim ID: ${claim.claimId}</h3>
            <p>Claimant Name: ${claim.claimantName}</p>
            <p>Claim Amount: ${claim.claimAmount}</p>
            <p>Status: <strong>${claim.status}</strong></p>
            <hr>
        `;
        
        claimHistoryDiv.appendChild(claimDiv);
    });
}

// Call the function to display claim history on page load
displayClaimHistory();
