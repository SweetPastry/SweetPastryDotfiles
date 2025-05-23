����   A s
      java/lang/Object <init> ()V  java/lang/Integer���
      ,mobiledevices/dmg/ghidra/GFileUtilityMethods writeTemporaryFile &(Ljava/io/InputStream;I)Ljava/io/File;  ghidra_file_system_  .tmp
      java/io/File createTempFile 4(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
     deleteOnExit  java/io/FileOutputStream
     ! (Ljava/io/File;)V
 # $ % & ' java/io/InputStream read ([B)I
 ) * + , - java/io/OutputStream write ([BII)V
 ) / 0  close
 2 3 4 5 6 java/lang/String length ()I   8 9 : makeConcatWithConstants &(Ljava/lang/String;)Ljava/lang/String;
 ) < , = ([B)V GHIDRA_FILE_SYSTEM_PREFIX Ljava/lang/String; ConstantValue GHIDRA_FILE_SYSTEM_SUFFIX Code LineNumberTable LocalVariableTable this .Lmobiledevices/dmg/ghidra/GFileUtilityMethods; %(Ljava/io/InputStream;)Ljava/io/File; inputStream Ljava/io/InputStream; 
Exceptions L java/io/IOException MethodParameters nRead I nWritten buffer [B maxBytesToWrite tempOutputFile Ljava/io/File; outputStream Ljava/io/OutputStream; StackMapTable R [ java/lang/Throwable $([BLjava/lang/String;)Ljava/io/File; i bytes prefix tempFile tempFileOut 
SourceFile GFileUtilityMethods.java BootstrapMethods f _ h
 i j k 9 l $java/lang/invoke/StringConcatFactory �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; InnerClasses o %java/lang/invoke/MethodHandles$Lookup q java/lang/invoke/MethodHandles Lookup 1       > ?  @      A ?  @          B   /     *� �    C       	 D        E F     G  B   1     *	� 
�    C        D        H I   J     K M    H       B  D     ^� M,� � Y,� N6  �:*� "6� � -� (`6� � ���-� .� :-� .�,�   L S   S U S    C   J               '  -  0  9  @   F ! I # L & P ' S & Y ' \ ( D   H  ' " N O   4 P O   - Q R    ^ H I     ^ S O   V T U   I V W  X   & �   #  ) Y  � � � F Z J     K M   	 H   S     \  B       Q+� L+� 1� +� 1=� +� 7  L����+� M,� � Y,� N-*� ;-� .� :-� .�,�  : ? F   F H F    C   >    ,  -  /  0  1   0 & 4 - 5 1 6 : 8 ? ; C < F ; L < O = D   4    ] O    Q ^ R     Q _ ?  - $ ` U  :  a W  X   ! � � �   Y 2  )  Z J     K M   	 ^   _    b    c d     g  e m   
  n p r 