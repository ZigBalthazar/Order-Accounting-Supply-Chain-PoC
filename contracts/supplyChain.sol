//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract supplyChainManagement{

 
    enum status { created,delivering,deliverd,accepted,declined}
    struct order{
        string title;
        string descriptoin;
        address supplier;
        address deliveryCompany;
        address customer;
        status _status;
    }   
    order[] ordrers;

    function createOrder(string memory _title, string memory _description, address _deliveryCompany, address _customer) public returns(uint){
        order memory _order = order(_title,_description,msg.sender,_deliveryCompany, _customer, status.created);
        uint index = ordrers.length - 1;
        ordrers[index] = _order;
        return index;
    }
}