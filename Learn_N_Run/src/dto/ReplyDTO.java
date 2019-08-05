package dto;

import java.sql.Timestamp;


public class ReplyDTO {
   private int no;
   private String content;
   private Timestamp date;
   private int group;
   private String reply_id;
   private int class_no;
   private int curriculum_no;

   public ReplyDTO() {
   }

   public ReplyDTO(int no, String content, Timestamp date, int group, String reply_id, int class_no,
         int curriculum_no) {
     
      this.no = no;
      this.content = content;
      this.date = date;
      this.group = group;
      this.reply_id = reply_id;
      this.class_no = class_no;
      this.curriculum_no = curriculum_no;
   }

   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public Timestamp getDate() {
      return date;
   }

   public void setDate(Timestamp date) {
      this.date = date;
   }

   public int getGroup() {
      return group;
   }

   public void setGroup(int group) {
      this.group = group;
   }

   public String getReply_id() {
      return reply_id;
   }

   public void setReply_id(String reply_id) {
      this.reply_id = reply_id;
   }

   public int getClass_no() {
      return class_no;
   }

   public void setClass_no(int class_no) {
      this.class_no = class_no;
   }

   public int getCurriculum_no() {
      return curriculum_no;
   }

   public void setCurriculum_no(int curriculum_no) {
      this.curriculum_no = curriculum_no;
   }


   
}