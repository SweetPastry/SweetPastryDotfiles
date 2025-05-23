����   A 1
      java/lang/Object <init> ()V
  	 
   )mobiledevices/dmg/btree/BTreeHeaderRecord getNodeSize ()S
      &mobiledevices/dmg/ghidra/GBinaryReader readNextByteArray (I)[B	      &mobiledevices/dmg/btree/BTreeMapRecord bitmap [B V(Lmobiledevices/dmg/ghidra/GBinaryReader;Lmobiledevices/dmg/btree/BTreeHeaderRecord;)V Code LineNumberTable LocalVariableTable this (Lmobiledevices/dmg/btree/BTreeMapRecord; reader (Lmobiledevices/dmg/ghidra/GBinaryReader; headerRecord +Lmobiledevices/dmg/btree/BTreeHeaderRecord; 
Exceptions % java/io/IOException MethodParameters 	getBitmap ()[B 
isNodeUsed (I)Z 	nodeIndex I block StackMapTable 
SourceFile BTreeMapRecord.java !                   [     *� *+,�  d� � �                                       ! "  #     $ &   	    !    ' (     /     *� �                         ) *     r     "*� l3 �~=pdx~� � �       
    '  (         "       " + ,    - ,  .    �  @ &    +    /    0