����   A
      java/lang/Object <init> ()V  java/util/HashMap
  	      .mobiledevices/dmg/hfsplus/AttributesFileParser map Ljava/util/Map;
      8org/catacombae/jparted/lib/fs/hfsx/HFSXFileSystemHandler 	getFSView 7()Lorg/catacombae/hfsexplorer/fs/BaseHFSFileSystemView;  4org/catacombae/hfsexplorer/fs/ImplHFSXFileSystemView
     getHFSPlusVolumeHeader @()Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusVolumeHeader;
      ! <org/catacombae/hfsexplorer/types/hfsplus/HFSPlusVolumeHeader getAttributesFile <()Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusForkData;   # $ % makeConcatWithConstants &(Ljava/lang/String;)Ljava/lang/String;
  ' ( ) writeVolumeHeaderFile �(Lorg/catacombae/hfsexplorer/fs/ImplHFSXFileSystemView;Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusForkData;Ljava/lang/String;)Ljava/io/File; + &mobiledevices/dmg/ghidra/GByteProvider
 * -  . (Ljava/io/File;)V	  0 1 2 provider (Lmobiledevices/dmg/ghidra/GByteProvider;
 4 5 6 7 8 java/io/File length ()J : &mobiledevices/dmg/ghidra/GBinaryReader
 9 <  = ,(Lmobiledevices/dmg/ghidra/GByteProvider;Z)V ? /mobiledevices/dmg/btree/BTreeRootNodeDescriptor
 > A  B +(Lmobiledevices/dmg/ghidra/GBinaryReader;)V	  D E F root 1Lmobiledevices/dmg/btree/BTreeRootNodeDescriptor; H I J K  java/util/Map clear
 * M N  close P 7org/catacombae/jparted/lib/fs/hfscommon/HFSCommonFSFile
 O R S T getInternalCatalogFile C()Lorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile; V Uorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile$HFSPlusImplementation
 U X Y Z getUnderlying ?()Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusCatalogFile;
 \ ] ^ _ ` ;org/catacombae/hfsexplorer/types/hfsplus/HFSPlusCatalogFile 	getFileID =()Lorg/catacombae/hfsexplorer/types/hfsplus/HFSCatalogNodeID;
 b c d e f 9org/catacombae/hfsexplorer/types/hfsplus/HFSCatalogNodeID toInt ()I h java/lang/Exception  # k .tmp
 4 m n o createTempFile 4(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
 4 q r  deleteOnExit t java/io/FileOutputStream
 s -
 w x y z { <org/catacombae/hfsexplorer/types/hfscommon/CommonHFSForkData create z(Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusForkData;)Lorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSForkData;
 w } ~  getBasicExtents I()[Lorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSExtentDescriptor; � 0mobiledevices/dmg/hfsplus/AttributesFileParser$1
 � �  � 3(Lmobiledevices/dmg/hfsplus/AttributesFileParser;)V
  � � � extractForkToStream �(Lorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSForkData;[Lorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSExtentDescriptor;Ljava/io/OutputStream;Lorg/catacombae/hfsexplorer/fs/ProgressMonitor;)J
 � M � java/io/OutputStream H � � � get &(Ljava/lang/Object;)Ljava/lang/Object; � 'mobiledevices/dmg/decmpfs/DecmpfsHeader
  � _ � )(Lorg/catacombae/jparted/lib/fs/FSFile;)I
 > � � � getNodes ()Ljava/util/List; � � � � � java/util/List iterator ()Ljava/util/Iterator; � � � � � java/util/Iterator hasNext ()Z � � � � next ()Ljava/lang/Object; � +mobiledevices/dmg/btree/BTreeNodeDescriptor
 � � � � 
getRecords � 'mobiledevices/dmg/btree/BTreeNodeRecord
 � � _ f
 � � � � getDecmpfsHeader +()Lmobiledevices/dmg/decmpfs/DecmpfsHeader; H � � � put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 	Signature `Ljava/util/Map<Lorg/catacombae/jparted/lib/fs/FSFile;Lmobiledevices/dmg/decmpfs/DecmpfsHeader;>; O(Lorg/catacombae/jparted/lib/fs/hfsx/HFSXFileSystemHandler;Ljava/lang/String;)V Code LineNumberTable LocalVariableTable this 0Lmobiledevices/dmg/hfsplus/AttributesFileParser; handler :Lorg/catacombae/jparted/lib/fs/hfsx/HFSXFileSystemHandler; prefix Ljava/lang/String; hfsxFileSystemView 6Lorg/catacombae/hfsexplorer/fs/ImplHFSXFileSystemView; volumeHeader >Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusVolumeHeader; 
attributes :Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusForkData; attributesFile Ljava/io/File; reader (Lmobiledevices/dmg/ghidra/GBinaryReader; StackMapTable � java/lang/String � 8org/catacombae/hfsexplorer/types/hfsplus/HFSPlusForkData 
Exceptions � java/io/IOException MethodParameters dispose hfsFile 9Lorg/catacombae/jparted/lib/fs/hfscommon/HFSCommonFSFile; catalogFile ALorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile; hfsPlusCatalogFile WLorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile$HFSPlusImplementation; 
underlying =Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusCatalogFile; fileID ;Lorg/catacombae/hfsexplorer/types/hfsplus/HFSCatalogNodeID; e Ljava/lang/Exception; file &Lorg/catacombae/jparted/lib/fs/FSFile; fork >Lorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSForkData; volumeHeaderFile volumeHeaderFileName out Ljava/io/OutputStream; � java/lang/Throwable Q(Lorg/catacombae/jparted/lib/fs/FSFile;)Lmobiledevices/dmg/decmpfs/DecmpfsHeader; header )Lmobiledevices/dmg/decmpfs/DecmpfsHeader; record )Lmobiledevices/dmg/btree/BTreeNodeRecord; node -Lmobiledevices/dmg/btree/BTreeNodeDescriptor; I 
SourceFile AttributesFileParser.java NestMembers BootstrapMethods � _attributesFile � 	Ghidra__
 $ $java/lang/invoke/StringConcatFactory �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; InnerClasses ?org/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile HFSPlusImplementation %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles Lookup !          �    �  1 2    E F      �  �  '     g*� *� Y� 	� 
+� � N-� :� :*-,� "  � &:*� *Y� ,� /� 3	�� �� 9Y*� /� ;:*� >Y� @� C�    �   2    "    $  %  ' $ ) 3 + @ - J . K 1 Y 3 f 4 �   R    g � �     g � �    g � �   P � �   J � �  $ C � �  3 4 � �  Y  � �  �    � K    �   � 4   �     � �   	 �   �    �   �   C     *� 
� G *� /� L�    �       7 	 8  9 �        � �   �     �  _ �  �   �     '+� OM,� QN-� U:� W:� [:� a�M�    # $ g  �   "    =  > 
 ?  @  A  B $ D % E �   R    � �  
  � �    � �    � �    � �  %  � �    ' � �     ' � �  �    d g �    �    ( )  �       T,� �-� i  j� l:� p� sY� u:,� v:+� |� �Y*� �� �X� �� :� ���  # ? G   G I G    �   2    M  N  Q  R  S # U ) V ? Y D Z G Y N Z Q [ �   H  )  � �    T � �     T � �    T � �    T � �   A � �  # 1 � �  �     � @    � � 4 �  �	 �     � �    �   �   �    � �  �  a     �*� C� �*� 
+� � � *� 
+� � � ��*+� �=� �*� C� �� � N-� � � [-� � � �:� �� � :� � � 7� � � �:� �� � �:� *� 
+� � W���ŧ���    �   F    `  a 	 d  e $ h * j / k 1 n R o t p } q � r � s � t � w � x � y �   >  �  � �  t % � �  R J � �    � � �     � � �  * w � �  �    	� �  ��  � �:� �  �     � �    �    �    � �     � �       �   �     U	 	 �      
 