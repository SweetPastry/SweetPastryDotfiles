Źžŗ¾   A 
      java/lang/Object <init> ()V
  	 
   &mobiledevices/dmg/ghidra/GBinaryReader getPointerIndex ()J	      'mobiledevices/dmg/btree/BTreeNodeRecord _offset J
     readNextInt ()I	     unknown0 I	     fileID	      unknown2
  " # $ readNextShort ()S	  & ' ( _typeLength S
  * + , readType <(Lmobiledevices/dmg/ghidra/GBinaryReader;)Ljava/lang/String;	  . / 0 type Ljava/lang/String;	  2 3  unknown3
 5 6 7 8 9 +mobiledevices/dmg/btree/BTreeNodeDescriptor getKind ()B	  ; <  unknown4	  > ?  unknown5	  A B  recordLength	  D E F _descriptor -Lmobiledevices/dmg/btree/BTreeNodeDescriptor; H &mobiledevices/dmg/btree/BTreeNodeKinds
  J K L getType ()Ljava/lang/String; N &mobiledevices/dmg/xattr/XattrConstants P com.apple.decmpfs
 R S T U V java/lang/String equals (Ljava/lang/Object;)Z X 'mobiledevices/dmg/decmpfs/DecmpfsHeader
  Z [  getRecordLength
 W ]  ^ ,(Lmobiledevices/dmg/ghidra/GBinaryReader;I)V	  ` a b _decmpfsHeader )Lmobiledevices/dmg/decmpfs/DecmpfsHeader; d com.apple.system.Security f java/lang/StringBuffer
 e 
  i j 9 readNextByte
 e l m n append (C)Ljava/lang/StringBuffer;
 e p q L toString X(Lmobiledevices/dmg/ghidra/GBinaryReader;Lmobiledevices/dmg/btree/BTreeNodeDescriptor;)V Code LineNumberTable LocalVariableTable this )Lmobiledevices/dmg/btree/BTreeNodeRecord; reader (Lmobiledevices/dmg/ghidra/GBinaryReader; 
descriptor StackMapTable 
Exceptions ~ java/io/IOException MethodParameters i buffer Ljava/lang/StringBuffer; getDescriptor /()Lmobiledevices/dmg/btree/BTreeNodeDescriptor; getUnknown0 getUnknown2 getUnknown3 getUnknown4 getUnknown5 	getFileID getDecmpfsHeader +()Lmobiledevices/dmg/decmpfs/DecmpfsHeader; getRecordOffset 
SourceFile BTreeNodeRecord.java !                       / 0    3     <     ?     B     ' (    E F    a b            r  s       Š*· *+¶ µ *+¶ µ *+¶ µ *+¶ µ *+¶ !µ %**+¶ )µ -*+¶ µ 1,¶ 4Ŗ     @’’’’      %   "      @§ !§ *+¶ µ :*+¶ µ =*+¶ µ @§ *,µ C,¶ 4  1*¶ IO¶ Q *» WY+*¶ Y· \µ _§ %*¶ Ic¶ Q § ,¶ 4 *¶ IO¶ Q ±    t   ^             ! $ # , % 5 & = ( ` * c - f 0 n 1 v 2 ~ 3  :  <  =  > ­ @ ¼ D Ć E Ļ I u        Š v w     Š x y    Š z F  {    ’ `    5  + |     }    	 x   z    + ,  s        ,» eY· gM>*“ %¢ +¶ hW,+¶ h¶ kW§’ę,¶ o°    t       L  M  N  O ! M ' Q u   *  
       , v w     , x y   $    {    ż 
 eś  |     }     x    K L  s   /     *“ -°    t       U u        v w    [   s   /     *“ @¬    t       X u        v w       s   /     *“ C°    t       [ u        v w       s   /     *“ ¬    t       ^ u        v w       s   /     *“ ¬    t       a u        v w       s   /     *“ 1¬    t       d u        v w       s   /     *“ :¬    t       g u        v w       s   /     *“ =¬    t       j u        v w       s   /     *“ ¬    t       m u        v w       s   /     *“ _°    t       p u        v w       s   /     *“ ­    t       s u        v w        