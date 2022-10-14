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
    // status _status;
 }   

 
}