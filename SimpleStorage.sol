// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; //solidity version

contract SimpleStorage {
    //uint get initialized to 0 if no value is given
  uint256 public  myFavoriteNumber; // 0, i added public to see visibility of the favoriteNuMBER

//creating an array
//    uint256 [] public  listOfFavoriteNumbers; 

    //basic test push into array
    // function addFavorNumber(uint256 number) public  {
    //     listOfFavoriteNumbers.push(number);
    // }

    //creating a custom Type
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

//dynamic array
    Person[] public listOfPeople; // []

    //mapping chelsea ->232
    mapping(string => uint256) public nameToFavoriteNumber;

    //static array
    Person[3] public listOfUkPeople; // [3,6,7], max of 3

    // Person public patricia = Person({favoriteNumber: 7, name: "patricia"});

    //add person (calldata, memory is needed when using string type as a parameter in an array)
    //memory and calldata are temporary memory. calldata param can't be changed when instanciated while memory can be changed
    function addPerson(string calldata _name, uint256 _favoriteNumber) public {
        // _name = "john is valid for memory"; 
        // _name = "bimbo is invalid for calldata";
        Person memory newPerson = Person(_favoriteNumber, _name); //create new person
        listOfPeople.push(newPerson); //push newPerson variable into the array

        //instatiate the mapping and assign keys and values
        nameToFavoriteNumber[_name]  = _favoriteNumber; //_name is key while _favoriteNumber is value
    }

//update
  function store(uint256 _favoriteNumber) public {
    myFavoriteNumber = _favoriteNumber;
    myFavoriteNumber = _favoriteNumber + 1;
  }

//VIEW, PURE

//view means that the function cannot update the state but only returns something
    function retrieve() public  view  returns(uint256) { 

        return  myFavoriteNumber;
    }

//pure disallows reading from state or storage
    function refund() public  pure  returns(uint256) { 

        return  7;
    }

//0xd9145CCE52D386f254917e481eB44e9943F39138
}