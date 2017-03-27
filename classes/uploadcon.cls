public class uploadcon {





@RemoteAction

public Static String saverep(){

PageReference pageRef = new PageReference('/apex/mypage');

Blob b = pageRef.getContent();



return 'b';

}
}