����   A �
      java/lang/Object <init> ()V
  	 
   mobiledevices/dmg/zlib/ZLIB 
decompress 8(Ljava/io/InputStream;IZ)Ljava/io/ByteArrayOutputStream;
     convertInputStreamToByteArray (Ljava/io/InputStream;)[B  java/io/ByteArrayOutputStream
       java/util/zip/Inflater
     (Z)V
     setInput ([BII)V
     ! inflate ([B)I
  # $  write
  & ' ( 
getTotalIn ()I * !java/util/zip/DataFormatException , java/io/IOException
 ) . / 0 
getMessage ()Ljava/lang/String;
 + 2  3 (Ljava/lang/String;)V
  5 6 7 compress $(Z[B)Ljava/io/ByteArrayOutputStream; 9 java/util/zip/Deflater
 8 ;  < (IZ)V
 8 
 8 ? @  finish
 8 B C D 
needsInput ()Z	 F G H I J java/lang/System err Ljava/io/PrintStream; L needs input??
 N O P Q 3 java/io/PrintStream println
 8 S T ! deflate
 8 &
 W X Y Z ! java/io/InputStream read
  \ ] ^ toByteArray ()[B Code LineNumberTable LocalVariableTable this Lmobiledevices/dmg/zlib/ZLIB; 7(Ljava/io/InputStream;I)Ljava/io/ByteArrayOutputStream; compressedIn Ljava/io/InputStream; expectedDecompressedLength I 
Exceptions MethodParameters inflater Ljava/util/zip/Inflater; nDecompressed e #Ljava/util/zip/DataFormatException; noWrap Z compressedBytes [B decompressedBOS Ljava/io/ByteArrayOutputStream; tempDecompressedBytes totalDecompressed offset StackMapTable s #([B)Ljava/io/ByteArrayOutputStream; decompressedBytes deflater Ljava/util/zip/Deflater; 	nDeflated compressedBOS 
tempBuffer nRead bytes 
SourceFile 	ZLIB.java !            _   3     *� �    `   
       a        b c     d  _   F     *+� �    `        a         b c      e f     g h  i     + j   	 e   g       _  �     �*+� :� Y� :�:66�� b� \� 3x� � K� Y� :		�d� 	� 6

� � !
`6
� "	� %`6���� :	� +Y	� -� 1��   � � )  `   V               # * % 8 & ; ) E + T - ] / b 0 e 3 l 5 v 7 � 8 � < � : � ; � > a   z  E ; k l 	 ] # m h 
 �  n o 	   � b c     � e f    � g h    � p q   � r s   � t u   � v s    w h   | x h  y   , �  	  W z  z  � ) � B ) i     + j    e   g   p    6 {  _   ;     *+� 4�    `       B a        b c      | s  j    |    6 7  _  9     n� Y� N�:6,�� W� 8Y� ::,,�d� =� >� A� � EK� M� R6� � -� "� U`6���-�    `   B    F  H  J  L  N # P 0 R 5 T = U E X N Z S [ V ^ _ ` i a l c a   R  # F } ~  N   h    n b c     n p q    n | s   f � u   ` � s   ] x h  y    �   z� 3 8� �  j   	 p   |       _   �     .��M� Y� N+,� V6� � -,� "���-� [�    `   "    m  n  p  q  r  t & u ) v a   4    � h    . b c     . e f   ( � s     � u  y    �  z � � 
 i     + j    e    �    �