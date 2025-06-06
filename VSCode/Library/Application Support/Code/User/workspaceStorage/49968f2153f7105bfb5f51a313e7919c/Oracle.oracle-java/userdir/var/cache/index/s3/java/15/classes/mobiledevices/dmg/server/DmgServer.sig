����   AW
      java/lang/Object <init> ()V  java/lang/StringBuilder
  
      java/lang/String toCharArray ()[C
     append (C)Ljava/lang/StringBuilder;	      java/lang/System out Ljava/io/PrintStream;
     toString ()Ljava/lang/String;
    ! " # java/io/PrintStream println (Ljava/lang/String;)V
  % &  flush	  ( )  err + .Waiting for client to connect to DMG server...
 - . / 0 1 "mobiledevices/dmg/server/DmgServer log ([Ljava/lang/String;)V 3 java/io/BufferedReader 5 java/io/InputStreamReader	  7 8 9 in Ljava/io/InputStream;
 4 ;  < (Ljava/io/InputStream;)V
 2 >  ? (Ljava/io/Reader;)V
 2 A B  readLine D DMG server has terminated. F open 
  H I J 
startsWith (Ljava/lang/String;)Z
 - L M N 	parseLine &(Ljava/lang/String;)Ljava/lang/String; P java/io/File
 O R  #
 O T U V exists ()Z X &mobiledevices/dmg/ghidra/GByteProvider
 W Z  [ (Ljava/io/File;)V ] &mobiledevices/dmg/reader/DmgFileReader
 \ _  ` +(Lmobiledevices/dmg/ghidra/GByteProvider;)V
 \ b c  open e  
  g h i split ((Ljava/lang/String;I)[Ljava/lang/String;
  k l m hashCode ()I o close
  q r s equals (Ljava/lang/Object;)Z u get_listing w get_info y get_data { %Exiting DMG server process: close cmd
 \ } o 
 W }
 \ � � � 
getListing $(Ljava/lang/String;)Ljava/util/List; � � � � m java/util/List size   � � � makeConcatWithConstants (I)Ljava/lang/String;
 - � � # sendResponse � � � � iterator ()Ljava/util/Iterator; � � � � V java/util/Iterator hasNext � � � � next ()Ljava/lang/Object; � %org/catacombae/jparted/lib/fs/FSEntry
 � � �  getName
 - � � # writeln
 � � � V isFolder   � � � (Z)Ljava/lang/String;
 \ � � � 	getLength *(Lorg/catacombae/jparted/lib/fs/FSEntry;)J   � � � (J)Ljava/lang/String;
 - � � 1 sendResponses
 \ � � � getInfo
 - � � � toFile b(Lmobiledevices/dmg/reader/DmgFileReader;Ljava/lang/String;)Lorg/catacombae/jparted/lib/fs/FSFile; �  
 \ � � � getData >(Lorg/catacombae/jparted/lib/fs/FSEntry;)Ljava/io/InputStream;
 � � � � � ,mobiledevices/dmg/ghidra/GFileUtilityMethods writeTemporaryFile %(Ljava/io/InputStream;)Ljava/io/File;
 O � �  getAbsolutePath
 O � � � length ()J � file sizes do not match!  � � N
 � } � java/io/InputStream � java/lang/Throwable
 � � � � addSuppressed (Ljava/lang/Throwable;)V � java/io/IOException
 � � �  
getMessage  �
 � � � � printStackTrace (Ljava/io/PrintStream;)V
 \ � � � getFileByPath ;(Ljava/lang/String;)Lorg/catacombae/jparted/lib/fs/FSEntry;
 � � � V isFile
 � � � � asFile (()Lorg/catacombae/jparted/lib/fs/FSFile; � $org/catacombae/jparted/lib/fs/FSLink
 \ � � � (convertPathToArrayAndStripFileSystemName '(Ljava/lang/String;)[Ljava/lang/String;
 � � � � getLinkTarget <([Ljava/lang/String;)Lorg/catacombae/jparted/lib/fs/FSEntry; � $org/catacombae/jparted/lib/fs/FSFile
  � � � indexOf (I)I
  � 	substring
   trim Code LineNumberTable LocalVariableTable this $Lmobiledevices/dmg/server/DmgServer; c C s Ljava/lang/String; encoded Ljava/lang/StringBuilder; 	charArray [C StackMapTable MethodParameters responseStrs [Ljava/lang/String; logstrs main 
childEntry 'Lorg/catacombae/jparted/lib/fs/FSEntry; path listing Ljava/util/List; info infoList temporaryFile Ljava/io/File; inputStream expectedFileLength J dmgFile &Lorg/catacombae/jparted/lib/fs/FSFile; line parts cmd dmgFileReader (Lmobiledevices/dmg/reader/DmgFileReader; provider (Lmobiledevices/dmg/ghidra/GByteProvider; openLine openPath openFile e Ljava/io/IOException; args inputReader Ljava/io/BufferedReader; LocalVariableTypeTable 9Ljava/util/List<Lorg/catacombae/jparted/lib/fs/FSEntry;>; $Ljava/util/List<Ljava/lang/String;>; link &Lorg/catacombae/jparted/lib/fs/FSLink; 
linkTarget limit I entry space 
SourceFile DmgServer.java BootstrapMethodsF H !No data stream for get_data for J 4IOException error in DMGServer command processing: L
MNO �P $java/lang/invoke/StringConcatFactory �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; InnerClassesS %java/lang/invoke/MethodHandles$LookupU java/lang/invoke/MethodHandles Lookup ! -             /     *� �                 	
   
 � #    �     Z� Y� 	L*� 
M,N-�66� 5-46� 
+� W� � � 
+� W���ʲ +� � �      .         #  *  1  ?  B  I  O ! Y "   *  # &    Z    R   M    " �      � � �       	 � #    @     � *� � � $�          %  &  '               � � 1    }     &*L+�=>� +2:� � ���� � $�          *  +  *  - % .          &      � �       � 0 1    }     &*L+�=>� +2:� '� ���� '� $�          1  2  1  4 % 5          &      � �       	 1   =    8� Y*S� ,� 2Y� 4Y� 6� :� =L+� @M,� � YCS� ,�,E� G� � YCS� ,�,� KN� OY-� Q:� S� � WY� Y:� \Y� ^:� a+� @:� �*d� f:�� ���2:		:
6
� j�      i   ���   ,h:�   <u�>�   \u̳�   L
n� p� 66� 0
t� p� &6�  
v� p� 6� 
x� p� 6�  �             @   �   �� YzS� ,� |� ~� YCS� ,�� K:� :� � � �  � �� � :� � � =� � � �:� �� �� Y� �� �  SY� �� �  S� ����� �� K:� �:� � � �  � �� � :� � � � � � :� ���� �� K:� �:� �� �� �� �7� �:� ,� �:� Ǹ �� ʔ� � Y�S� ,� �� �� Y� �  S� ,� &� ҧ :� � ҧ :� ������ |� :� |� :� ��� ~� :� ~� :� ��� YCS� ,� >M� Y,� ݺ �  S� ,,� '� �� YCS� ,� :� YCS� ,�� B�� ���� � wD� �[�� ���� � lI� �[�� ���� �  '� � 4 =� � JN� �[�� �  '&   4 =&   JN&  [�&  �&  &(&     2 L   9  ;  > # ? ' � 3 @ 4 B = � I C J E O G Y H a L l M w N | P � Q � R � T � U � V � W � X8 ZD �N �Z [[ ]b ^k _z `� b� c� d� c� e� g� i� j� k� l m n p r t# v( w0 z9 |B }G ~I N �V �a �m �p �u �� �� |� �� �� L� �� L� �� �� �� � � �# �& �4 �7 �   � � + b e k \    � ? � 6! N "# B l$ 9 9 u%&  � # �'(  �,)  �*  �
+ 	 wX,-  l�./  #�0  O�1  Y�2# � 34   85   67 8    k \9 � 6!:   + '� 4 2 �   O�  W \�  � � =  "� '  � �� C� '  � �� �   �� < �L ��   2   O W \     � � �  ��   2   O W \  G �� 	  2   O W \ �  �� G �� 	  2   O W �  ��   2  N �i �   5   
 � �        Z*+� �M,� �,� � ,� �,� � <>�
� 1,� �:*+� � �:� �� 	� �� � 	M����      J    �  � 
 �  �  �  �  � ! � * � 0 � 4 � 7 � < � D � J � R � U � X �   >  0 %;<  < =  ! 7>?    Z,-     Z   T@     �  �� � ( � ��    	,     
 M N    Z     * � �<*`� �M,�          �  �  �        0    A?       0   B   CD    K EK GK IQ   
 RTV 