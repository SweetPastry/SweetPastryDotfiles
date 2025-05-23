����   A b
      java/lang/Object <init> ()V
  	 
   &mobiledevices/dmg/ghidra/GBinaryReader getPointerIndex ()J
     readNextInt ()I	      'mobiledevices/dmg/decmpfs/DecmpfsHeader compression_magic I
     isLittleEndian ()Z
     setLittleEndian (Z)V	    !  compression_type
  # $  readNextLong	  & ' ( uncompressed_size J       	 , - . / 0 java/lang/System err Ljava/io/PrintStream; 2 here
 4 5 6 7 8 java/io/PrintStream println (Ljava/lang/String;)V
  : ; < readNextByteArray (I)[B	  > ? @ 
attr_bytes [B
 B C D E F )mobiledevices/dmg/ghidra/GStringUtilities toString (I)Ljava/lang/String; ,(Lmobiledevices/dmg/ghidra/GBinaryReader;I)V Code LineNumberTable LocalVariableTable this )Lmobiledevices/dmg/decmpfs/DecmpfsHeader; reader (Lmobiledevices/dmg/ghidra/GBinaryReader; size index originalEndian Z endIndex 	nElements StackMapTable 
Exceptions X java/io/IOException MethodParameters getCompressionMagic ()Ljava/lang/String; getCompressionType getUncompressedSize getAttrBytes ()[B 
SourceFile DecmpfsHeader.java !            !     ' (    ? @      G  H  K  
   �*� +� B*+� � +� 6+� *+� � *+� "� %+� !�a
a7 )q	�� 	
e7+� e7 )q	�� 
a7� 	�� � +1� 3*+�� 9� =�    I   J       	        $  ,  2  :   E ! K $ T & _ ' h ) o * w , � - J   H    � K L     � M N    � O   	 z P (   l Q R  : I S (  T / T (  U    � K     �  V     W Y   	 M   O    Z [  H   2     *� � A�    I       0 J        K L    \   H   /     *� �    I       4 J        K L    ]   H   /     *� %�    I       8 J        K L    ^ _  H   /     *� =�    I       < J        K L    `    a