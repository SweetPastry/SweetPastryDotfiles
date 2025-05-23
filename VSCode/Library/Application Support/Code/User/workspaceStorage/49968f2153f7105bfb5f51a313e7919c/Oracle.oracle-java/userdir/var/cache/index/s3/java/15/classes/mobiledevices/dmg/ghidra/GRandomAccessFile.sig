����   A �	      *mobiledevices/dmg/ghidra/GRandomAccessFile open Z  java/io/IOException 
  GhidraRandomAccessFile is closed
     <init> (Ljava/lang/String;)V
      java/lang/Object ()V	     EMPTY [B	     buffer	     bufferOffset J	    !  bufferFileStartIndex	  # $  
lastbuffer	  & '  lastbufferOffset	  ) *  lastbufferFileStartIndex , java/io/RandomAccessFile
 + .  / #(Ljava/io/File;Ljava/lang/String;)V	  1 2 3 randomAccessFile Ljava/io/RandomAccessFile;
  5 6  	checkOpen
 + 8 9  close
 + ; < = length ()J ? pos cannot be less than zero       
  C D  
swapInLast
  F G H ensure (I)V
  J K L read ([BII)I   
 O P Q R S java/lang/System 	arraycopy *(Ljava/lang/Object;ILjava/lang/Object;II)V
  U V W seek (J)V
  Y Z [ write ([BII)V
 + Y
 + U
 + _ K ` ([B)I BUFFER_SIZE I ConstantValue Code LineNumberTable LocalVariableTable this ,Lmobiledevices/dmg/ghidra/GRandomAccessFile; StackMapTable 
Exceptions file Ljava/io/File; mode Ljava/lang/String; MethodParameters finalize #org.netbeans.SourceLevelAnnotations Ljava/lang/Override; pos readByte ()B b blocklength offset readLen (B)V B ([B)V newBufferOffset bytesNeeded oldFileStartIndex oldBufferOffset 
oldSeekPos 
swapbuffer swapbufferOffset swapbufferFileStartIndex <clinit> 
SourceFile GRandomAccessFile.java !     
       a b  c    M  2 3              !     $     '     *           6   d   M     *� � � Y	� ��    e           ! f        g h   i     j        /  d   �     >*� *� � *	� *	� *� � "*	� %*	� (*� *� +Y+,� -� 0*� �    e   .    N           !  &  + O 8 P = Q f        > g h     > k l    > m n  j      o   	 k   m    p   d   ?     *� � �    e   
    U  X f        g h   i     q     r    9   d   G     *� 4*� *� 0� 7�    e       d  e 	 f  g f        g h   j       < =  d   :     *� 4*� 0� :�    e   
    o  p f        g h   j       V W  d   �     `*� 4	�� � Y>� �*� �� *�  @a�� .*� B*� �� *�  @a�� *� � *	� *� **� e� �    e   .    �  � 
 �  � * � . � D � K � P � U � _ � f       ` g h     ` s   i     j      o    s    t u  d   F     *� 4*� E*� *� �3�    e       �  � 	 � f        g h   j       K `  d   E     *� 4*++�� I�    e   
    �  � f        g h      v   j      o    v    K L  d       l*� 466� @*� e�� M*� �d6� M6*� E*� *� �+� Nd6`=� **� *� a�a� T����    e   >    �  �  �  �  � $ � ) � - � 3 � C � J � O � T � e � j � f   >   Z w b    l g h     l v     l x b    l < b   e y b  i    � � %� 7 j      o    v   x   <    Z z  d   N     *� 4*�YT� X�    e       �  �  � f        g h      v {  j      o    v    Z |  d   I     *� 4*++�� X�    e       �  �  � f        g h      v   j      o    v    Z [  d   �     '*� 4*� 0+� \*� � *	� *� � "*	� %�    e       �  �  �  �  � ! � & � f   *    ' g h     ' v     ' x b    ' < b  j      o    v   x   <    G H  d  ?  
   �*� 4*� A*� 7 a7*� �a*� ���� l*� B*� e7*� ��  *�  @a�� �a*� ���� 2* a� *M�� *� 0*� � ]*� 0*� � ^W*	� � 	*� �    e   >     	  	 & * 3 Z b j u � � � f   >  3 \ }     � g h     � ~ b  	 �     � �    { �   i    � Z    .�  j      o    ~    D   d   �     H*� 4*� � � �*� L*� A*� 7**� "� **� %� **� (� *+� "* � %*� (�    e   6      ! $ % & ( ') /* 7, <- A. G/ f   *    H g h    4 �    / �    ) �   i     j       �   d         �� �    e         �    �