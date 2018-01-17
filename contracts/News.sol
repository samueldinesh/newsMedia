pragma solidity ^0.4.18;

contract News{

	address	public user;
	uint private  userType;

	struct Articles{//news article information
		uint articleId;
		address authorAddress;
		string author;
		uint articleLength;
		uint reviewValidity;
		uint views;
		string content;
		//also add validator address for record
		
	}
	mapping(uint => Articles) public article; //map article struct to address //??convert address to int

	function News(uint _type)public{//class constructor function
		user = msg.sender;
		userType = _type;
	}

    function Writer(address _address,uint _articleId,string _author,string _content) payable public returns(bool) {//bring artivleId for map key
        var art = article[_articleId]; //[_address]
        
        art.articleId = _articleId;
        art.authorAddress = _address;
        art.author = _author;
        art.content =  _content;
        
        return true;// written to blockchain
        
    }
    //call smart contract to review with user address,articleId, vote (true false)
    function Reviewer(uint _articleId, bool vote) payable public returns(uint){
        
        assert(article[_articleId].articleId==_articleId);
        if(vote) article[_articleId].reviewValidity +=1;
        return article[_articleId].reviewValidity/7;
    }   
    
    function Reader(uint _articleId) view public returns(string){
            
	    //show matched articleId  //?? use for loop to find matching articleid
	    assert(article[_articleId].articleId==_articleId);
	    
	    return article[_articleId].content ;
    }
     
}