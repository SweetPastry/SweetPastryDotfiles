����   A h
      java/lang/Object <init> ()V  mobiledevices/dmg/ghidra/GConv
  
   	intToLong (I)J  ��    ����  java/lang/StringBuffer
  
     append (C)Ljava/lang/StringBuffer;
     toString ()Ljava/lang/String;
     	byteToInt (B)I
   ! " # $ java/lang/Integer toHexString (I)Ljava/lang/String;
  & ' ( zeropad '(Ljava/lang/String;I)Ljava/lang/String;
  * + , 
shortToInt (S)I
 . / 0 # 1 java/lang/Long (J)Ljava/lang/String; 3  
  5  6 (Ljava/lang/String;)V
 8 9 : ; < java/lang/String length ()I
  > ? @ insert (IC)Ljava/lang/StringBuffer; 	BYTE_MASK I ConstantValue   � 
SHORT_MASK INT_MASK J Code LineNumberTable LocalVariableTable this  Lmobiledevices/dmg/ghidra/GConv; byteToShort (B)S b B MethodParameters 
byteToLong (B)J s S shortToLong (S)J i ([B)Ljava/lang/String; array [B buffer Ljava/lang/StringBuffer; StackMapTable [ (B)Ljava/lang/String; (S)Ljava/lang/String; l Ljava/lang/String; len zerosNeeded 
SourceFile 
GConv.java !       A B  C    D  E B  C      F G  C          H   3     *� �    I   
       J        K L   	 M N  H   1      �~��    I       $ J        O P   Q    O   	    H   0      �~�    I       , J        O P   Q    O   	 R S  H   3     	 �~� 	�    I       4 J       	 O P   Q    O   	 + ,  H   /     ~�    I       < J        T U   Q    T   	 V W  H   2     ~� 	�    I       D J        T U   Q    T   	    H   1     � �    I       L J        X B   Q    X   	  Y  H   �     /� Y� L*M,�>6� ,36+�� W����+� �    I       P  Q  R $ Q * T J        O P    / Z [    ' \ ]  ^    �   _  _  �  Q    Z   	 # `  H   6     � � � %�    I       \ J        O P   Q    O   	 # a  H   6     � )� � %�    I       d J        T U   Q    T   	 # $  H   4     
� � %�    I       l J       
 X B   Q    X   	 # 1  H   4     
� -� %�    I       t J       
 b G   Q    b   	 ' (  H   �     3*� 2K� Y*� 4M*� 7d>6� ,0� =W����,� �    I         �  �  �   � ( � . � J   4    X B    3 T c     3 d B   # \ ]    e B  ^    �  �  Q   	 T   d    f    g