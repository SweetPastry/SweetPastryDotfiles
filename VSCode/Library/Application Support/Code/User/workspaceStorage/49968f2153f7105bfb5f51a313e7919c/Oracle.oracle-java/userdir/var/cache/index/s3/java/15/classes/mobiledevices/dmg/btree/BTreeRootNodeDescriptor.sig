����   A p
      +mobiledevices/dmg/btree/BTreeNodeDescriptor <init> +(Lmobiledevices/dmg/ghidra/GBinaryReader;)V  java/util/ArrayList
  
   ()V	      /mobiledevices/dmg/btree/BTreeRootNodeDescriptor nodes Ljava/util/List;  )mobiledevices/dmg/btree/BTreeHeaderRecord
  	     headerRecord +Lmobiledevices/dmg/btree/BTreeHeaderRecord;  +mobiledevices/dmg/btree/BTreeUserDataRecord
  	     userDataRecord -Lmobiledevices/dmg/btree/BTreeUserDataRecord; ! &mobiledevices/dmg/btree/BTreeMapRecord
   #  $ V(Lmobiledevices/dmg/ghidra/GBinaryReader;Lmobiledevices/dmg/btree/BTreeHeaderRecord;)V	  & ' ( 	mapRecord (Lmobiledevices/dmg/btree/BTreeMapRecord; * + , - . java/util/List add (Ljava/lang/Object;)Z
  0 1 2 getNodeSize ()S  ��
 5 6 7 8 9 &mobiledevices/dmg/ghidra/GBinaryReader length ()J
 5 ; < = setPointerIndex (I)V
  ? @ A readRecordOffsets W(Lmobiledevices/dmg/ghidra/GBinaryReader;JLmobiledevices/dmg/btree/BTreeHeaderRecord;)V
  C D E readRecords ,(Lmobiledevices/dmg/ghidra/GBinaryReader;J)V
  ? * H I J get (I)Ljava/lang/Object; L java/lang/Exception 	Signature ?Ljava/util/List<Lmobiledevices/dmg/btree/BTreeNodeDescriptor;>; Code LineNumberTable LocalVariableTable node -Lmobiledevices/dmg/btree/BTreeNodeDescriptor; i I this 1Lmobiledevices/dmg/btree/BTreeRootNodeDescriptor; reader (Lmobiledevices/dmg/ghidra/GBinaryReader; nodeSize StackMapTable 
Exceptions ^ java/io/IOException MethodParameters getHeaderRecord -()Lmobiledevices/dmg/btree/BTreeHeaderRecord; getUserDataRecord /()Lmobiledevices/dmg/btree/BTreeUserDataRecord; getMapRecord *()Lmobiledevices/dmg/btree/BTreeMapRecord; getNode 0(I)Lmobiledevices/dmg/btree/BTreeNodeDescriptor; e Ljava/lang/Exception; index getNodes ()Ljava/util/List; A()Ljava/util/List<Lmobiledevices/dmg/btree/BTreeNodeDescriptor;>; 
SourceFile BTreeRootNodeDescriptor.java !                 ' (       M    N      O  C     �*+� *� Y� 	� *� Y+� � *� Y+� � *�  Y+*� � "� %*� *� ) W*� � /3~=>�+� 4�� 9+� :� Y+� :*� � ) W+�*� � >+�� B`>���*+	*� � F�    P   B           (  8  C  N  Z  _   i ! u " � # �  � & � ' Q   4  i   R S  P @ T U    � V W     � X Y  N M Z U  [    � P   5  � ? \     ] _    X    ` a  O   /     *� �    P       * Q        V W    b c  O   /     *� �    P       . Q        V W    d e  O   /     *� %�    P       2 Q        V W    f g  O   k     *� � G � �M�      K  P       7  9  : Q        h i     V W      j U  [    N K _    j    k l  O   /     *� �    P       ? Q        V W   M    m  n    o