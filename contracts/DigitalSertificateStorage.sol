// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalCertificateStorage {
    struct Certificate {
        string certificateId;
        string ownerName;
        string ipfsHash;
        uint256 issuedAt;
        bool valid;
    }

    mapping(string => Certificate) private certificates;

    event CertificateIssued(
        string certificateId,
        string ownerName,
        string ipfsHash,
        uint256 issuedAt
    );

    function issueCertificate(
        string memory _certificateId,
        string memory _ownerName,
        string memory _ipfsHash
    ) public {
        require(bytes(_certificateId).length > 0, "Certificate ID required");
        require(certificates[_certificateId].issuedAt == 0, "Certificate already exists");

        certificates[_certificateId] = Certificate({
            certificateId: _certificateId,
            ownerName: _ownerName,
            ipfsHash: _ipfsHash,
            issuedAt: block.timestamp,
            valid: true
        });

        emit CertificateIssued(_certificateId, _ownerName, _ipfsHash, block.timestamp);
    }

    function verifyCertificate(string memory _certificateId)
        public
        view
        returns (
            string memory certificateId,
            string memory ownerName,
            string memory ipfsHash,
            uint256 issuedAt,
            bool valid
        )
    {
        Certificate memory cert = certificates[_certificateId];
        require(cert.issuedAt != 0, "Certificate not found");
        return (
            cert.certificateId,
            cert.ownerName,
            cert.ipfsHash,
            cert.issuedAt,
            cert.valid
        );
    }

    function revokeCertificate(string memory _certificateId) public {
        Certificate storage cert = certificates[_certificateId];
        require(cert.issuedAt != 0, "Certificate not found");
        cert.valid = false;
    }
}
