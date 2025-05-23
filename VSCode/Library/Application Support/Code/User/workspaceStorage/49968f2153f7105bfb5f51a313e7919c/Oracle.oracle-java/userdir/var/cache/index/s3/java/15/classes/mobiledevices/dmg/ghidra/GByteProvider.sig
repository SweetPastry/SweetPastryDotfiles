����   A �
      java/lang/Object <init> ()V	  	 
   &mobiledevices/dmg/ghidra/GByteProvider file Ljava/io/File;  *mobiledevices/dmg/ghidra/GRandomAccessFile  r
     #(Ljava/io/File;Ljava/lang/String;)V	     randomAccessFile ,Lmobiledevices/dmg/ghidra/GRandomAccessFile;
      java/io/File getName ()Ljava/lang/String;
      getAbsolutePath " java/io/FileInputStream
 ! $  % (Ljava/io/File;)V
 ! ' ( ) skip (J)J
  + ,  close
  . / 0 length ()J 2 java/io/IOException
  4 5 6 seek (J)V
  8 9 : readByte ()B
  < = > read ([B)I   @ A B makeConcatWithConstants (J)Ljava/lang/String;
 1 D  E (Ljava/lang/String;)V
  G H I write (B)V
  K H L ([B)V N java/io/Closeable Code LineNumberTable LocalVariableTable this (Lmobiledevices/dmg/ghidra/GByteProvider; 
Exceptions MethodParameters permissions Ljava/lang/String; getFile ()Ljava/io/File; getInputStream (J)Ljava/io/InputStream; index J is Ljava/io/FileInputStream; #org.netbeans.SourceLevelAnnotations Ljava/lang/Override; isValidIndex (J)Z StackMapTable (J)B 	readBytes (JJ)[B b [B nRead I i 	writeByte (JB)V value B 
writeBytes (J[B)V values 
SourceFile GByteProvider.java BootstrapMethods x Unable to read  bytes z
 { | } A ~ $java/lang/invoke/StringConcatFactory �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; InnerClasses � %java/lang/invoke/MethodHandles$Lookup � java/lang/invoke/MethodHandles Lookup !    M               %  O   X     *� *+� *� Y+� � �    P          	    Q        R S         T     1 U           O   a     *� *+� *� Y+,� � �    P       !  " 	 #  $ Q         R S            V W  T     1 U   	    V    X Y  O   /     *� �    P       * Q        R S       O   2     *� � �    P       1 Q        R S        O   2     *� � �    P       5 Q        R S    Z [  O   Z     � !Y*� � #N-� &X-�    P       <  =  > Q         R S      \ ]    ^ _  T     1 U    \    ,   O   6     *� � *�    P   
    G  H Q        R S   T     1 `     a    / 0  O   2     *� � -�    P       N Q        R S   T     1  b c  O   n     	�� *� � -�� � �N�      1  P       S  U  W Q        R S      \ ]  d   	 @@ 1 U    \    9 e  O   H     *� � 3*� � 7�    P   
    ^  _ Q        R S      \ ]  T     1 U    \    f g  O   �     2*� � 3!��:*� � ;6�!�� � 1Y!� ?  � C��    P       f  g  h  i ! j / l Q   4    2 R S     2 \ ]    2 / ]   $ h i    j k  d   	 � / l T     1 U   	 \   /    m n  O   W     *� � 3*� � F�    P       s  t  u Q         R S      \ ]     o p  T     1 U   	 \   o    q r  O   W     *� � 3*� -� J�    P       {  |  } Q         R S      \ ]     s i  T     1 U   	 \   s    t    u v     y  w    
  � � � 