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

    modifier onlyOrderDeliveringCompany(uint _index){
        require(ordrers[_index].deliveryCompany == msg.sender);
        _;
    }

    
    modifier onlyCustomer(uint _index){
        require(ordrers[_index].customer == msg.sender);
        _;
    }

    modifier orderCreated(uint _index){
        require(ordrers[_index]._status == status.created);
        _;
    }

    modifier orderDelivering(uint _index) {
        require(ordrers[_index]._status == status.delivering);
        _;
    }

    modifier orderDelivered(uint _index) {
        require(ordrers[_index]._status == status.deliverd);
        _;
    }

    function createOrder(string memory _title, string memory _description, address _deliveryCompany, address _customer) public returns(uint){
        order memory _order = order(_title,_description,msg.sender,_deliveryCompany, _customer, status.created);
        uint index = ordrers.length - 1;
        ordrers[index] = _order;
        return index;
    }


    function startDeliveringOrder(uint _index)public onlyOrderDeliveringCompany(_index) orderCreated(_index) {
        order storage _order = ordrers[_index];
        _order._status = status.delivering;
    }

    function stopDeliveringOrder(uint _index) public onlyOrderDeliveringCompany(_index) orderDelivering(_index){
        order storage _order = ordrers[_index];
        _order._status = status.deliverd;
    }

    function acceptOrder(uint _index) public onlyCustomer(_index) orderDelivered(_index){
        ordrers[_index]._status = status.accepted;
    } 

    function declineOrder(uint _index) public onlyCustomer(_index) orderDelivered(_index) {
        ordrers[_index]._status = status.declined;
    }

}