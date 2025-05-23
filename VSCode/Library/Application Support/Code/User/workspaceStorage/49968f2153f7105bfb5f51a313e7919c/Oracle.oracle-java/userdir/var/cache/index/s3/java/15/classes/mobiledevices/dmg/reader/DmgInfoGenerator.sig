����   A
      java/lang/Object <init> ()V  java/text/DateFormat
  
   getDateTimeInstance (II)Ljava/text/DateFormat;	      )mobiledevices/dmg/reader/DmgInfoGenerator df Ljava/text/DateFormat;	     
fileSystem (Lmobiledevices/dmg/reader/DmgFileReader;	     filePath Ljava/lang/String;	     parser 0Lmobiledevices/dmg/hfsplus/AttributesFileParser;
   ! " # $ &mobiledevices/dmg/reader/DmgFileReader getFileByPath ;(Ljava/lang/String;)Lorg/catacombae/jparted/lib/fs/FSEntry;	  & ' ( entry 'Lorg/catacombae/jparted/lib/fs/FSEntry; * java/util/ArrayList
 )  - << no information available >> / 0 1 2 3 java/util/List add (Ljava/lang/Object;)Z
 5 6 7 8 9 %org/catacombae/jparted/lib/fs/FSEntry getName ()Ljava/lang/String;   ; < = makeConcatWithConstants &(Ljava/lang/String;)Ljava/lang/String; ? $org/catacombae/jparted/lib/fs/FSFile A 
Type: File
 > C D E getCombinedLength ()J
  G H I getSizeString (J)Ljava/lang/String;  ;
 > L M N getAllForks )()[Lorg/catacombae/jparted/lib/fs/FSFork;
 P Q R S 9 $org/catacombae/jparted/lib/fs/FSFork getForkIdentifier
 P U V E 	getLength  X < Y 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  [ \ ] appendFileID 9(Ljava/util/List;Lorg/catacombae/jparted/lib/fs/FSFile;)V
 _ ` a b c .mobiledevices/dmg/hfsplus/AttributesFileParser getDecmpfsHeader Q(Lorg/catacombae/jparted/lib/fs/FSFile;)Lmobiledevices/dmg/decmpfs/DecmpfsHeader;
 e f g h E 'mobiledevices/dmg/decmpfs/DecmpfsHeader getUncompressedSize  ; k java/io/IOException m &org/catacombae/jparted/lib/fs/FSFolder o Type: Folder
  q r s startFolderSizeCalculation <(Lorg/catacombae/jparted/lib/fs/FSFolder;)Ljava/lang/String;  ; v $org/catacombae/jparted/lib/fs/FSLink
   x y z (convertPathToArrayAndStripFileSystemName '(Ljava/lang/String;)[Ljava/lang/String;
 u | } ~ getLinkTarget <([Ljava/lang/String;)Lorg/catacombae/jparted/lib/fs/FSEntry; � Type: Symbolic link (broken) � Size: - (broken link) � Type: Symbolic link (file)
 > � � � getMainFork (()Lorg/catacombae/jparted/lib/fs/FSFork; � Type: Symbolic link (folder)
  � � � getClass ()Ljava/lang/Class;
 � � � � � java/lang/String valueOf &(Ljava/lang/Object;)Ljava/lang/String;  ; � Size: - (unknown type)
 u � � 9 getLinkTargetString  ;  ; � Size: - (unknown size)
 5 � � � getAttributes .()Lorg/catacombae/jparted/lib/fs/FSAttributes;
  � � � appendDateInformation ?(Lorg/catacombae/jparted/lib/fs/FSAttributes;Ljava/util/List;)V
  � � � appendPosixInformation
  � � � appendWindowsInformation � 7org/catacombae/jparted/lib/fs/hfscommon/HFSCommonFSFile
 � � � � getInternalCatalogFile C()Lorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile; � Uorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile$HFSPlusImplementation
 � � � � getUnderlying ?()Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusCatalogFile;
 � � � � � ;org/catacombae/hfsexplorer/types/hfsplus/HFSPlusCatalogFile 	getFileID =()Lorg/catacombae/hfsexplorer/types/hfsplus/HFSCatalogNodeID;
 � � � � � 9org/catacombae/hfsexplorer/types/hfsplus/HFSCatalogNodeID toInt ()I
 � � � � � java/lang/Integer toHexString (I)Ljava/lang/String;  ; � java/lang/Exception
 � � � 9 
getMessage 	 ;
 � � � � � *org/catacombae/jparted/lib/fs/FSAttributes hasPOSIXFileAttributes ()Z
 � � � � getPOSIXFileAttributes B()Lorg/catacombae/jparted/lib/fs/FSAttributes$POSIXFileAttributes;
 � � � � 9 >org/catacombae/jparted/lib/fs/FSAttributes$POSIXFileAttributes getPermissionString 
 ;
 � � � E 	getUserID  � < I
 � � � E 
getGroupID  �
 � � � � hasWindowsFileAttributes
 � � � � getWindowsFileAttributes 7()Lorg/catacombae/jparted/lib/fs/WindowsFileAttributes;
 � � � � � 3org/catacombae/jparted/lib/fs/WindowsFileAttributes 	isArchive  � < � (Z)Ljava/lang/String;
 � � � � isCompressed  �
 � �  � isDirectory  �
 � � isEncrypted  �
 � � isHidden  �
 � � isNormal  �
 � � 	isOffline  �
 � � 
isReadOnly  �
 � � isReparsePoint  �
 � � isSparseFile  �
 �  � isSystem  �
 �#$ � isTemporary  �
 �'( � 	isVirtual  �
 �+, � hasCreateDate
 �./0 getCreateDate ()Ljava/util/Date;
 234 format $(Ljava/util/Date;)Ljava/lang/String;  ;
 �78 � hasModifyDate
 �:;0 getModifyDate  ;
 �>? � hasAttributeModifyDate
 �AB0 getAttributeModifyDate  ;
 �EF � hasAccessDate
 �HI0 getAccessDate  ;
 �LM � hasBackupDate
 �OP0 getBackupDate  ;
STUV I java/lang/Long toString  ;Y *org/catacombae/hfsexplorer/ObjectContainer
S[ �\ (J)Ljava/lang/Long;
X^ _ (Ljava/lang/Object;)V
 abc calculateFolderSize W(Lorg/catacombae/jparted/lib/fs/FSFolder;Lorg/catacombae/hfsexplorer/ObjectContainer;)V	Xefg o Ljava/lang/Object;
Sij E 	longValue
 �lm  printStackTraceo :Exception while calculating! See debug console for info...
 lqrs listEntries *()[Lorg/catacombae/jparted/lib/fs/FSEntry;	uvwxy java/lang/System err Ljava/io/PrintStream;   ;
|}~� java/io/PrintStream println (Ljava/lang/String;)V m(Lmobiledevices/dmg/reader/DmgFileReader;Ljava/lang/String;Lmobiledevices/dmg/hfsplus/AttributesFileParser;)V Code LineNumberTable LocalVariableTable this +Lmobiledevices/dmg/reader/DmgInfoGenerator; MethodParameters getInformation ()Ljava/util/List; fork &Lorg/catacombae/jparted/lib/fs/FSFork; decmpfsHeader )Lmobiledevices/dmg/decmpfs/DecmpfsHeader; file &Lorg/catacombae/jparted/lib/fs/FSFile; allForks '[Lorg/catacombae/jparted/lib/fs/FSFork; folder (Lorg/catacombae/jparted/lib/fs/FSFolder; link &Lorg/catacombae/jparted/lib/fs/FSLink; 
linkTarget infoList Ljava/util/List; attrs ,Lorg/catacombae/jparted/lib/fs/FSAttributes; LocalVariableTypeTable $Ljava/util/List<Ljava/lang/String;>; StackMapTable� 	Signature &()Ljava/util/List<Ljava/lang/String;>; hfsFile 9Lorg/catacombae/jparted/lib/fs/hfscommon/HFSCommonFSFile; catalogFile ALorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile; hfsPlusCatalogFile WLorg/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile$HFSPlusImplementation; 
underlying =Lorg/catacombae/hfsexplorer/types/hfsplus/HFSPlusCatalogFile; fileID ;Lorg/catacombae/hfsexplorer/types/hfsplus/HFSCatalogNodeID; e Ljava/lang/Exception; M(Ljava/util/List<Ljava/lang/String;>;Lorg/catacombae/jparted/lib/fs/FSFile;)V 
posixAttrs @Lorg/catacombae/jparted/lib/fs/FSAttributes$POSIXFileAttributes; S(Lorg/catacombae/jparted/lib/fs/FSAttributes;Ljava/util/List<Ljava/lang/String;>;)V windowsFileAttributes 5Lorg/catacombae/jparted/lib/fs/WindowsFileAttributes; 
attributes result J 
baseString ,Lorg/catacombae/hfsexplorer/ObjectContainer; resultString >Lorg/catacombae/hfsexplorer/ObjectContainer<Ljava/lang/Long;>; value Ljava/lang/Long;� ([Lorg/catacombae/jparted/lib/fs/FSEntry; i(Lorg/catacombae/jparted/lib/fs/FSFolder;Lorg/catacombae/hfsexplorer/ObjectContainer<Ljava/lang/Long;>;)V 
SourceFile DmgInfoGenerator.java BootstrapMethods� Name: � Total Size: �     : � Decmpfs Size: � Size: � !Type: Symbolic link (unknown [])� Link Target: � Type: Unknown []� File ID: 0x� Unable to obtain file ID. � Permissions: � User ID:     � Group ID:    � Archive:    � Compressed: � Directory:  � Encrypted:  � Hidden:     � Normal:     � Off-line:   � Read-only:  � Reparse:    � Sparse:     � System:     � Temp:       � Virtual:    � 
Created: � Contents Modified: � Attributes Modified: � Last Accessed: � Last Backup:   bytes <FSEntrySummaryPanel.calculateFolderSize(): unexpected type 
 <	 $java/lang/invoke/StringConcatFactory �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; InnerClasses ?org/catacombae/hfsexplorer/types/hfscommon/CommonHFSCatalogFile HFSPlusImplementation POSIXFileAttributes %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles Lookup                        ' (        	   � �   �     &*� *� 	� *+� *,� *-� *+,� � %�   �       "     #  $  %  & % '�   *    &��     &      &      &   �              �� �  z  
  D� )Y� +L*� %� +,� . W+�+*� %� 4� :  � . W*� %� >� �*� %� >M+@� . W+*,� B� F� J  � . W,� KN-:�66� *2:+� O*� T� F� W  � . W����*+,� Z*� � ,*� ,� ^:� +*� d� F� i  � . W� :�X*� %� l� (*� %� lM+n� . W+*,� p� t  � . W�)*� %� u� *� %� uM,*� *� � w� {N-� +� . W+�� . W� �-� >� n-� >:+�� . W+*� �� T� F� t  � . W� K::�66� *2:	+	� O*	� T� F� W  � . W���է J-� l� '-� l:+�� . W+*� p� t  � . W� +-� �� �� �  � . W+�� . W+,� �� �  � . W� "+*� %� �� �� �  � . W+�� . W*� %� �M*,+� �*,+� �*,+� �+�  � � � j �   @   *  ,  -  .  1 - 3 7 4 ? 5 H 6 \ 7 a 8 z 9 } : � 9 � 8 � < � > � @ � A � B � C � B � G � F � I � J � K � L � M � N O P R S$ T( U1 V= XD YJ ZS [k \r ]� ^� _� ^� ]� a� b� c� d� e� f� h� i� k l	 n o( r0 t6 u< vB x�   �  z ��  � ��  ? ���  a o��  � �� � �� 	J b�� r :�� � ��  ��� $ �� (   D��   <�� 0 �� �     <�� �   n �  /� Q   / >��  � -0B j� .� : u 5� @ 	  / u 5 >��  � -   / u 5  *� �   �  \ ] �       I,� �N-� �:� �:� �:� �:+� �� ź �  � . W� N+-� κ �  � . W�    4 7 � �   * 
   }  ~    �  �   � 4 � 7 � 8 � H ��   \ 	  /��   )��   "��   ��    ��  8 ��    I��     I��    I�� �       I�� �    w ��   	�  �  �   �  � � �   �     =+� ҙ 8+� �N,-� ܺ �  � . W,-� � �  � . W,-� � �  � . W�   �       �  �  �  � , � < ��   *   0��    =��     =��    =�� �       =�� �    <�   	�  �  �   �  � � �  ~     �+� � �+� �N,-� � �  � . W,-� �� �  � . W,-� ��  � . W,-��  � . W,-��	  � . W,-�
�  � . W,-��  � . W,-��  � . W,-��  � . W,-��  � . W,-��!  � . W,-�"�%  � . W,-�&�)  � . W�   �   B    �  �  �  � , � < � L � \ � l � | � � � � � � � � � � � � ��   *   ���    ���     ���    ��� �       ��� �    � ��   	�  �  �   �  � � �       �+�*� ,*� +�-�1�5  � . W+�6� ,*� +�9�1�<  � . W+�=� ,*� +�@�1�C  � . W+�D� ,*� +�G�1�J  � . W+�K� ,*� +�N�1�Q  � . W�   �   .    �  �  � % � < � C � Z � a � x �  � � ��        ���     ���    ��� �       ��� �    �   	�  �  �   �  H I �   N     �RN-�W  �   �   
    �  ��        ��     ��   �  �   �    r s �   �     /�XY	�Z�]N*+-�`*-�d�S�h� FM� N-�knM,�    ! $ � �   "    �  �  � ! � $ � % � ) � - ��   >   ��  ! �   % ��    /��     /��  - �  �      �� �    d ��  ��   �   bc �  9     �+�pN-�66� r-2:� >� +,�d�S:�h� >� �� Ta�Z:,�d� 6� l� *� l,�`� !� u� � �t� �� ��z  �{�����   �   :    �  � ! � * � @ � F � I � Q � ^ � i � n � y � | � � ��   4  * ��   c ' (    ���     ���    ��� �       ��� �    � �� < 5
� � �   	�  �  �   � �   ��   � ! � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �   
     � 	 � �	 