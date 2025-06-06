����   AH
      java/lang/Object <init> ()V  java/util/ArrayList
  	      &mobiledevices/dmg/reader/DmgFileReader rootFolders Ljava/util/List;	     fileSystemHandlers	     provider (Lmobiledevices/dmg/ghidra/GByteProvider;
      &mobiledevices/dmg/ghidra/GByteProvider getFile ()Ljava/io/File;
     ! " 2org/catacombae/hfsexplorer/win32/WindowsLowLevelIO isSystemSupported ()Z
 $ % & ' ( java/io/File getAbsolutePath ()Ljava/lang/String;
  *  + (Ljava/lang/String;)V	  - . / rras .Lorg/catacombae/io/ReadableRandomAccessStream; 1 $org/catacombae/io/ReadableFileStream
 0 *
 4 5 6 7 8 Porg/catacombae/dmgextractor/encodings/encrypted/ReadableCEncryptedEncodingStream isCEncryptedEncoding 1(Lorg/catacombae/io/ReadableRandomAccessStream;)Z	 : ; < = > java/lang/System err Ljava/io/PrintStream; @ "Trying to detect UDIF structure...
 B C D E + java/io/PrintStream println
 G H I J 8 )org/catacombae/hfsexplorer/UDIFRecognizer isUDIF L /UDIF structure found! Creating filter stream... N org/catacombae/udif/UDIFFile
 M P  Q 1(Lorg/catacombae/io/ReadableRandomAccessStream;)V
 M S T U getView $()Lorg/catacombae/udif/UDIFFileView;
 W X Y Z [  org/catacombae/udif/UDIFFileView getPlistData ()[B ] dmg-xml
  _ ` a debug ([BLjava/lang/String;)V c *org/catacombae/udif/UDIFRandomAccessStream
 b P f 'UDIF structure not found. Proceeding... h 4org/catacombae/hfsexplorer/PartitionSystemRecognizer
 g P
 g k l m getPartitionSystem ;()Lorg/catacombae/hfsexplorer/partitioning/PartitionSystem; o java/io/IOException q :No system partitions found. Perhaps the decryption failed?
 n * t u v w x 7org/catacombae/hfsexplorer/partitioning/PartitionSystem getUsedPartitionEntries 6()[Lorg/catacombae/hfsexplorer/partitioning/Partition;
  z { | openPartition 6(Lorg/catacombae/hfsexplorer/partitioning/Partition;)V ~  � � � 1org/catacombae/hfsexplorer/partitioning/Partition getStartOffset ()J ~ � � � 	getLength � /org/catacombae/hfsexplorer/FileSystemRecognizer
 � �  � 2(Lorg/catacombae/io/ReadableRandomAccessStream;J)V
 � � � � detectFileSystem B()Lorg/catacombae/hfsexplorer/FileSystemRecognizer$FileSystemType;	 � � � � � >org/catacombae/hfsexplorer/FileSystemRecognizer$FileSystemType HFS_PLUS @Lorg/catacombae/hfsexplorer/FileSystemRecognizer$FileSystemType;	 � � � � HFSX	 � � � � HFS	 � � � � � (mobiledevices/dmg/reader/DmgFileReader$1 I$SwitchMap$org$catacombae$hfsexplorer$FileSystemRecognizer$FileSystemType [I
 � � � � ordinal ()I	 � � � � � 1org/catacombae/jparted/lib/fs/FileSystemMajorType 	APPLE_HFS 3Lorg/catacombae/jparted/lib/fs/FileSystemMajorType;	 � � � � APPLE_HFS_PLUS	 � � � � 
APPLE_HFSX
 � � � � createDefaultHandlerFactory :()Lorg/catacombae/jparted/lib/fs/FileSystemHandlerFactory;	 � � � � � Horg/catacombae/jparted/lib/fs/FileSystemHandlerFactory$StandardAttribute CACHING_ENABLED JLorg/catacombae/jparted/lib/fs/FileSystemHandlerFactory$StandardAttribute;
 � � � � � 6org/catacombae/jparted/lib/fs/FileSystemHandlerFactory isSupported M(Lorg/catacombae/jparted/lib/fs/FileSystemHandlerFactory$StandardAttribute;)Z
 � � � � getCreateAttributes E()Lorg/catacombae/jparted/lib/fs/FileSystemHandlerFactory$Attributes;
 � � � � � java/lang/Boolean valueOf (Z)Ljava/lang/Boolean;
 � � � � � Aorg/catacombae/jparted/lib/fs/FileSystemHandlerFactory$Attributes setBooleanAttribute `(Lorg/catacombae/jparted/lib/fs/FileSystemHandlerFactory$StandardAttribute;Ljava/lang/Boolean;)V � ,org/catacombae/io/ReadableConcatenatedStream
 � �  � 3(Lorg/catacombae/io/ReadableRandomAccessStream;JJ)V � 4org/catacombae/jparted/lib/ReadableStreamDataLocator
 � P
 � � � � createHandler [(Lorg/catacombae/jparted/lib/DataLocator;)Lorg/catacombae/jparted/lib/fs/FileSystemHandler; � � � � � java/util/List add (Ljava/lang/Object;)Z
 � � � � � /org/catacombae/jparted/lib/fs/FileSystemHandler getRoot *()Lorg/catacombae/jparted/lib/fs/FSFolder; � 8org/catacombae/jparted/lib/fs/hfsx/HFSXFileSystemHandler � .mobiledevices/dmg/hfsplus/AttributesFileParser
 � � � � ( &org/catacombae/jparted/lib/fs/FSFolder getName
 � �  � O(Lorg/catacombae/jparted/lib/fs/hfsx/HFSXFileSystemHandler;Ljava/lang/String;)V	  � � � parser 0Lmobiledevices/dmg/hfsplus/AttributesFileParser; � LUNKNOWN file system type.  Can't Open filesystem.  Suspect this is an APFS.
 � � � �  ,org/catacombae/io/ReadableRandomAccessStream close java/lang/Exception
 �  dispose �  clear
	
 " %org/catacombae/jparted/lib/fs/FSEntry isFile $org/catacombae/jparted/lib/fs/FSFile
 getMainFork (()Lorg/catacombae/jparted/lib/fs/FSFork;
 � $org/catacombae/jparted/lib/fs/FSFork
 getReadableRandomAccessStream 0()Lorg/catacombae/io/ReadableRandomAccessStream; � � length 'mobiledevices/dmg/reader/DmgInputStream
 P	!"#$% (org/catacombae/jparted/lib/fs/FSForkType MACOS_RESOURCE *Lorg/catacombae/jparted/lib/fs/FSForkType;
'() getForkByType R(Lorg/catacombae/jparted/lib/fs/FSForkType;)Lorg/catacombae/jparted/lib/fs/FSFork;
 �+,- getDecmpfsHeader Q(Lorg/catacombae/jparted/lib/fs/FSFile;)Lmobiledevices/dmg/decmpfs/DecmpfsHeader;
/012 � 'mobiledevices/dmg/decmpfs/DecmpfsHeader getCompressionType4 1mobiledevices/dmg/decmpfs/DecmpfsCompressionTypes
/67 [ getAttrBytes9 java/io/ByteArrayInputStream
8; < ([BII)V> mobiledevices/dmg/zlib/ZLIB
= 
8A B ([B)V
/DE � getUncompressedSize
=GHI 
decompress 7(Ljava/io/InputStream;I)Ljava/io/ByteArrayOutputStream;
KLMN [ java/io/ByteArrayOutputStream toByteArray
	 �
QRSTU ,mobiledevices/dmg/ghidra/GFileUtilityMethods writeTemporaryFile $([BLjava/lang/String;)Ljava/io/File;W java/io/FileInputStream
VY Z (Ljava/io/File;)V
 \]^ decompressResourceFork m(Lorg/catacombae/jparted/lib/fs/FSEntry;Lorg/catacombae/io/ReadableRandomAccessStream;I)Ljava/io/InputStream;
Q`Ta %(Ljava/io/InputStream;)Ljava/io/File;  cde makeConcatWithConstants 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
ghij � java/io/InputStream read
gljm ([B)I	 opq bedc )Lmobiledevices/dmg/ghidra/GDataConverter;stuvm 'mobiledevices/dmg/ghidra/GDataConverter getInt	 xyq ledc
g{|} skip (J)J
QT� &(Ljava/io/InputStream;I)Ljava/io/File;� )mobiledevices/dmg/reader/DmgInfoGenerator
�� � m(Lmobiledevices/dmg/reader/DmgFileReader;Ljava/lang/String;Lmobiledevices/dmg/hfsplus/AttributesFileParser;)V
���� getInformation ()Ljava/util/List;� /
���� � java/lang/String equals ���� iterator ()Ljava/util/Iterator;���� " java/util/Iterator hasNext���� next ()Ljava/lang/Object;
 ��� getFileByPath ;(Ljava/lang/String;)Lorg/catacombae/jparted/lib/fs/FSEntry;
	�� " isFolder
	�� � asFolder
 ���� listEntries *()[Lorg/catacombae/jparted/lib/fs/FSEntry;
	��� asFile (()Lorg/catacombae/jparted/lib/fs/FSFile;��������
���� split '(Ljava/lang/String;)[Ljava/lang/String;
 :��� 	arraycopy *(Ljava/lang/Object;ILjava/lang/Object;II)V
 ��� (convertPathToArrayAndStripFileSystemName
 ���� getEntry <([Ljava/lang/String;)Lorg/catacombae/jparted/lib/fs/FSEntry;� )mobiledevices/dmg/ghidra/GDataConverterLE
� � )mobiledevices/dmg/ghidra/GDataConverterBE
� � java/io/Closeable 	Signature :Ljava/util/List<Lorg/catacombae/jparted/lib/fs/FSFolder;>; CLjava/util/List<Lorg/catacombae/jparted/lib/fs/FileSystemHandler;>; +(Lmobiledevices/dmg/ghidra/GByteProvider;)V Code LineNumberTable LocalVariableTable this (Lmobiledevices/dmg/reader/DmgFileReader; MethodParameters open udifFile Lorg/catacombae/udif/UDIFFile; stream ,Lorg/catacombae/udif/UDIFRandomAccessStream; 	partition 3Lorg/catacombae/hfsexplorer/partitioning/Partition; file Ljava/io/File; partitionSystemRecognizer 6Lorg/catacombae/hfsexplorer/PartitionSystemRecognizer; partitionSystem 9Lorg/catacombae/hfsexplorer/partitioning/PartitionSystem; 
partitions 4[Lorg/catacombae/hfsexplorer/partitioning/Partition; StackMapTable� 
Exceptions 	plistData [B fileName Ljava/lang/String; fsMajorType stage1 factory 8Lorg/catacombae/jparted/lib/fs/FileSystemHandlerFactory; dataLocator (Lorg/catacombae/jparted/lib/DataLocator; fileSystemHandler 1Lorg/catacombae/jparted/lib/fs/FileSystemHandler; selectedPartition fsOffset J fsLength fsr 1Lorg/catacombae/hfsexplorer/FileSystemRecognizer; fsType #org.netbeans.SourceLevelAnnotations Ljava/lang/Override; getData >(Lorg/catacombae/jparted/lib/fs/FSEntry;)Ljava/io/InputStream; mainForkStream zlib Lmobiledevices/dmg/zlib/ZLIB; inputStream Ljava/io/InputStream; uncompressedBytes Ljava/io/ByteArrayOutputStream; tempDecompressedFile resourceFork &Lorg/catacombae/jparted/lib/fs/FSFork; resourceForkStream decmpfsHeader )Lmobiledevices/dmg/decmpfs/DecmpfsHeader; fsFile &Lorg/catacombae/jparted/lib/fs/FSFile; mainFork entry 'Lorg/catacombae/jparted/lib/fs/FSEntry; i I expectedLength tempFile input 	sizeBytes size 
flagsBytes startDistanceBytes startDistance tempCompressedFile uncompressedByteStream� getInfo $(Ljava/lang/String;)Ljava/util/List; info +Lmobiledevices/dmg/reader/DmgInfoGenerator; path 8(Ljava/lang/String;)Ljava/util/List<Ljava/lang/String;>; 
getListing handler ([Lorg/catacombae/jparted/lib/fs/FSEntry; 
fileByPath list LocalVariableTypeTable 9Ljava/util/List<Lorg/catacombae/jparted/lib/fs/FSEntry;>;# M(Ljava/lang/String;)Ljava/util/List<Lorg/catacombae/jparted/lib/fs/FSEntry;>; *(Lorg/catacombae/jparted/lib/fs/FSEntry;)J header e Ljava/io/IOException; 	splitPath [Ljava/lang/String; temp/ <clinit> 
SourceFile DmgFileReader.java NestMembers BootstrapMethods8 dmg resource fork for : :
;<=d> $java/lang/invoke/StringConcatFactory �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; InnerClasses FileSystemType StandardAttribute 
AttributesD %java/lang/invoke/MethodHandles$LookupF java/lang/invoke/MethodHandles Lookup !   �  yq   pq         � �    . /      �   �    �   �   � �   d      *� *� Y� 	� 
*� Y� 	� *+� �   �       *  '  (  +  ,�        ��         �       �  �  �  	   �*� � L� � *� Y+� #� )� ,� *� 0Y+� #� 2� ,*� ,� 3� � 9?� A*� ,� F� ?� 9K� A� MY� 0Y+� #� 2� OM*,� R� V\� ^� bY*� ,� dN*-� ,� � 9e� A� gY*� ,� iM,� jN-� � nYp� r�-� s ::�66� 2:*� y����   �   ^    0  2  3   6 / 9 9 = A > K ? S A f B s D  E � F � H � K � L � N � O � R � S � T � S � V�   R  f ��   ��  � ��    ���    ���  � B��  � =��  � '�� �   5 �   $	� M�  g t�    $ g t��  � �     n  ` a �   ?      �   �       Z�        ��     ��    �� �   	�  �    { | �  z    +� } A+� � 7� �Y*� , � �:� �:� �� � �� � �� ղ �� �.�     3            #   +� �:� � �:� � �:� :� �:		� �� �� 	� �� �� Ŷ �	�� � �Y*� , � �:
� 	*� ,:
� �Y
� �:	� �:*� � � W*� 
� � � W� � *� �Y� �� � �� � �� � 9�� A�   �   z    ]  ^  `  a $ c < h ` j e k h m m n p p u q x s { w � x � y � { � z � � � � � � � � � � � � � � � � � � � � ��   �  e � �  m � �  u � �  � � / 
 { �� �  � ��� 	 � O� / 
 � D��  � ;��   ��    ��  ��  ��   ���  $ �� � �   3 � <   ~ � �  #�  ��   ��  �� N�     n�   �    �  �   �     3*� ,� � � L*� �� *� ��*� �*� � *� 
� �    	   �   & 	   � 	 �  �  �  �  �   � ) � 2 ��       3��  �    L  �     n�    �   �� �  1     �+� �+�� �+�M,�N-�	�� "-�:� 	�� �Y��� �-�	�� �,� �&:�:*� �� �*� �,�*:� ��.� b�53� �8Y�5�5�d�:��=Y�?:�8Y�5�@:�C��F:		�J+�O�P:
�VY
�X��.� *+�C��[��   �   ~    �  �  �  �  � $ � 0 � : � = � F � O � V � ] � _ � i � n � p � y � � � � � � � � � � � � � � � � � � � � � � � � � � ��   z  $ � /  � 5��  � '�   �  	 � 
� 
 O �  V � /  i �   �	
   �    ���     � �   * � :� ! �� /)=�   	  �     n�      ]^ �       ٻY,��_:� 9+�O� #�b  � A�VY�X:6 � �fW�����:�kW3� �n�r � �w�r 6�:�kW�:		�kW�w	�r 6

d��zX
d�~:�VY�X:�=Y�?:�F:�8Y�J�@�   �   b    �  �  �  � ! � , � 7 � = � C � H � P � W � d � p � u � } � � � � � � � � � � � � � � � � ��   �  /     ���     �    � /    �   ��  , �   H ��  p i  u d�  � W� 	 � C 
 � +�  �  �   � ��  �  �    � / $g� �  I�     n�           �   l     +� ��Y*+*� ���M,����   �         �           ��     � �    �     �     ! �  v  	   �� Y� 	M+� +���� 3*� �� N-�� � -�� � �:,� � � W��� F*+��N-� <-��� 5-����::�66� 2:,� � W����,�   �   6   	 
  4 @ F L P W ` z � ��   H  4 "�  z 	  ` )�#  L =$    ���     ��   �%  &      �%' �   = �  �� 	�� "� %  � �	((  �   � �  �     �   )  �* �   �     M+� � +�~� ;+���M,�	�� ,��*� �� *� �+���*N-� -�C�� N
���  ' B F n �   2   " # $ "% '( .) :* >+ C1 F/ G0 I3�   4  : 	+  G ,-   0    M��     M �    @� B n� �      �� �   �     (+���M,�� ���,�d��N,-,�d��-�   �      > ? @ B C &D�   *    (��     (�    ./   0/ �    � 1�      �� �   �     E+� +���� �*� �� M,�� � #,�� � �N-*+����:� �����   �   "   L M O -P 8Q =R @T CU�   *  8   - "�    E��     E� �    � 	�%� �      2  �   1      ��Y�ów��Y�Ƴn�   �   
    ! 
 " 3   45     �6    9 7?   *  � �@@ �     � �A@ � �B CEG 