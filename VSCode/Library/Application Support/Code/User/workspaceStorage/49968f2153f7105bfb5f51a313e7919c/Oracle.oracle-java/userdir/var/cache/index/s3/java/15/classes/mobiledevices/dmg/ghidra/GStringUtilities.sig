����   A J
      java/lang/Object <init> ()V  java/lang/String
  
   ([B)V  java/lang/StringBuffer
     (I)V
      java/lang/Integer toHexString (I)Ljava/lang/String;
     length ()I  0
      append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;
  " # $ toString ()Ljava/lang/String;
  & ' ( 	substring (II)Ljava/lang/String;
  * + , parseInt (Ljava/lang/String;I)I . java/lang/Exception 0 )mobiledevices/dmg/ghidra/GStringUtilities Code LineNumberTable LocalVariableTable this +Lmobiledevices/dmg/ghidra/GStringUtilities; value I bytes [B 	byteIndex StackMapTable 9 MethodParameters convertBytesToString ([BI)Ljava/lang/String; bs Ljava/lang/String; i buf Ljava/lang/StringBuffer; convertStringToBytes (Ljava/lang/String;)[B hexstr 
SourceFile GStringUtilities.java ! /           1   /     *� �    2       
 3        4 5   	 #   1   �     &�L+�d=� +�Tz;����� Y+� 	�    2          	          3        & 6 7    " 8 9  	  : 7  ;   
 � 	 < =    6   	 > ?  1   �     @� Yh� M>� ,*3 �~� :� � 
,� W,� W����,� !�    2   "         !  " ' # . % 5   ; ' 3   4    @ A   . B 7    @ 8 9     @  7   5 C D  ;    �  �   �  =   	 8      	 E F  1   �     3*� l�L=*� � *`� %N+l-� )�T����+�L�    / 0 -  2   "    , 	 -  .  / ( - . 1 0 3 1 6 3   *    @ A   # B 7  	 ' 8 9    3 G A   ;    �  <� "�     - =    G    H    I