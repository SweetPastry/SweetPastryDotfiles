����   A �
      java/lang/Object <init> ()V  java/util/ArrayList
  	      +mobiledevices/dmg/btree/BTreeNodeDescriptor _recordOffsets Ljava/util/List;	     _records
      &mobiledevices/dmg/ghidra/GBinaryReader readNextInt ()I	     fLink I	     bLink
  ! " # readNextByte ()B	  % & ' kind B	  ) * ' height
  , - . readNextShort ()S	  0 1 2 
numRecords S	  4 5 2 reserved
 7 8 9 : . )mobiledevices/dmg/btree/BTreeHeaderRecord getNodeSize       
  > ? @ 	readShort (J)S
 B C D E F java/lang/Short valueOf (S)Ljava/lang/Short; H I J K L java/util/List add (Ljava/lang/Object;)Z
  N O . getNumRecords
  Q R S getRecordOffsets ()Ljava/util/List; H U V W get (I)Ljava/lang/Object;
 B Y Z . 
shortValue  ��
  ] ^ _ setPointerIndex (J)V a 'mobiledevices/dmg/btree/BTreeNodeRecord
 ` c  d X(Lmobiledevices/dmg/ghidra/GBinaryReader;Lmobiledevices/dmg/btree/BTreeNodeDescriptor;)V 	Signature #Ljava/util/List<Ljava/lang/Short;>; ;Ljava/util/List<Lmobiledevices/dmg/btree/BTreeNodeRecord;>; +(Lmobiledevices/dmg/ghidra/GBinaryReader;)V Code LineNumberTable LocalVariableTable this -Lmobiledevices/dmg/btree/BTreeNodeDescriptor; reader (Lmobiledevices/dmg/ghidra/GBinaryReader; 
Exceptions r java/io/IOException MethodParameters readRecordOffsets W(Lmobiledevices/dmg/ghidra/GBinaryReader;JLmobiledevices/dmg/btree/BTreeHeaderRecord;)V recordOffset nodeStartIndex J header +Lmobiledevices/dmg/btree/BTreeHeaderRecord; position StackMapTable readRecords ,(Lmobiledevices/dmg/ghidra/GBinaryReader;J)V offset recordIndex record )Lmobiledevices/dmg/btree/BTreeNodeRecord; i %()Ljava/util/List<Ljava/lang/Short;>; 
getRecords =()Ljava/util/List<Lmobiledevices/dmg/btree/BTreeNodeRecord;>; getFLink getBLink getKind 	getHeight getReserved 
SourceFile BTreeNodeDescriptor.java !                 & '    * '    1 2    5 2       e    f     e    g     h  i   �     K*� *� Y� 	� 
*� Y� 	� *+� � *+� � *+�  � $*+�  � (*+� +� /*+� +� 3�    j   * 
          "  *   2 ! : " B # J $ k       K l m     K n o  p     q s    n    t u  i   �     9 � 6�a ;e7+� =6� � *� 
� A� G W ;e7��ٱ    j   "    (  *  +  ,  . - / 5 0 8 1 k   >    v 2    9 l m     9 n o    9 w x    9 y z   + { x  |    � � �  p     q s    n   w   y    } ~  i   �  	   M6*� M� C*� P� T � B� X6[~� a7+� \� `Y+*� b:*� � G W�����    j   "    4  6  8 ) 9 / ; : < F 4 L > k   H   '  2  )  � x  :  � �   I �     M l m     M n o    M w x  |   	 � � H p     q s   	 n   w    R S  i   /     *� 
�    j       A k        l m   e    �  � S  i   /     *� �    j       E k        l m   e    �  �   i   /     *� �    j       N k        l m    �   i   /     *� �    j       W k        l m    � #  i   /     *� $�    j       ` k        l m    � #  i   /     *� (�    j       h k        l m    O .  i   /     *� /�    j       p k        l m    � .  i   /     *� 3�    j       x k        l m    �    �