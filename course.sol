pragma solidity ^0.5.0;


contract mcq {
    constructor() public {
        owner = msg.sender;
    }
    address owner;

    uint[] answers = [1,2,1,2,3,3,1,4,2,4];
    uint[] phoneNumbers ;
    mapping(uint => uint) scores;

    event scoreInfo(
      uint score
    );

    function setAnswers(uint[] memory UserAnswers, uint _phone) public returns(uint) {
        uint count = 0;
        for(uint i = 0 ; i < 10 ; i++){
            if(answers[i] == UserAnswers[i])
                count = count+1;
        }
        phoneNumbers.push(_phone);
        scores[_phone] = count;

        emit scoreInfo(count);

        return count;
    }

    function getAllPhone()   public  view returns( uint[] memory){
        require(msg.sender == owner);
        return phoneNumbers;
    }

    function getMarksByPhone(uint _phone) public view returns(uint){
        require(msg.sender == owner);
        return scores[_phone];
    }
}
