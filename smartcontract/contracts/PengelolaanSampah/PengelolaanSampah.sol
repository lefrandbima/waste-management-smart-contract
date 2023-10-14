// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PengelolaanSampah {
    struct DataSampah {
        uint id;
        uint berat;
        string catatan;
        address pos;
    }

    mapping(uint => DataSampah) public dataSampah;

    event SampahDitambahkan(uint id, uint berat, string catatan, address pos);
    event SampahDikirim(uint id, address pos);
    event SampahDiupdate(uint id, uint berat, string catatan, address pos);
    

    function tambahDataSampah(uint _id, uint _berat, string memory _catatan) public {
        require(dataSampah[_id].id == 0, "Data sampah dengan ID ini sudah ada.");
        dataSampah[_id] = DataSampah(_id, _berat, _catatan, msg.sender);
        emit SampahDitambahkan(_id, _berat, _catatan, msg.sender);
    }

    function updateDataSampah(uint _id, uint _berat, string memory _catatan) public {
        require(dataSampah[_id].id != 0, "Data sampah dengan ID ini tidak ditemukan.");
        require(dataSampah[_id].pos == msg.sender, "Anda tidak berhak mengupdate data ini.");
        dataSampah[_id].berat = _berat;
        dataSampah[_id].catatan = _catatan;
        emit SampahDiupdate(_id, _berat, _catatan, msg.sender);
    }

    function kirimDataSampah(uint _id, address _tujuan) public {
        require(dataSampah[_id].id != 0, "Data sampah dengan ID ini tidak ditemukan.");
        require(dataSampah[_id].pos == msg.sender, "Anda tidak berhak mengirim data ini.");
        dataSampah[_id].pos = _tujuan;
         emit SampahDikirim(_id,  msg.sender);
    }

    function cekPosisiSampah(uint _id) public view returns (uint , uint , string memory, address) {
        require(dataSampah[_id].id != 0, "Data sampah dengan ID ini tidak ditemukan.");
        DataSampah storage sampah = dataSampah[_id];
        return (sampah.id, sampah.berat, sampah.catatan, sampah.pos);
    }
}