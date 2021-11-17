package guestbook.service;

import java.util.List;

import guestbook.model.Message;

public class MessageListView {
   private int messageTotalCount;
   private int currentPageNumber;
   private List<Message> messageList;
   private int pageTotalCount;
   private int messageCountPerPage;
   private int firstRow;
   private int endRow;
   public MessageListView(int messageTotalCount, int currentPageNumber, List<Message> messageList,
         int messageCountPerPage, int firstRow, int endRow) {
      super();
      this.messageTotalCount = messageTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.messageList = messageList;
      this.messageCountPerPage = messageCountPerPage;
      this.firstRow = firstRow;
      this.endRow = endRow;
      calculatePAgeTotalCount();
   }
   private void calculatePAgeTotalCount() {
      if(messageTotalCount == 0) {
         pageTotalCount=0;
      }else {
         pageTotalCount=messageTotalCount/messageCountPerPage;
         if(messageCountPerPage%messageCountPerPage>0) {
            ++pageTotalCount;
         }
      }
      
   }
   public int getMessageTotalCount() {
      return messageCountPerPage;
   }
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public List<Message> getMessageList() {
		return messageList;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public int getEndRow() {
		return endRow;
	}
	
   public boolean isEmpty() {
	   return messageTotalCount==0;
   }
   
}