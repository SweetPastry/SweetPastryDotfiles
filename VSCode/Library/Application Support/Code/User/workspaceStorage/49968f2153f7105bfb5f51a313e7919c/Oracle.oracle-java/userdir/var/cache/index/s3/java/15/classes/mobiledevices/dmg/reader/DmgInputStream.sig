����   A 1
      java/io/InputStream <init> ()V	  	 
   'mobiledevices/dmg/reader/DmgInputStream stream .Lorg/catacombae/io/ReadableRandomAccessStream;      ,org/catacombae/io/ReadableRandomAccessStream length ()J     read ()I     ([B)I     ([BII)I 1(Lorg/catacombae/io/ReadableRandomAccessStream;)V Code LineNumberTable LocalVariableTable this )Lmobiledevices/dmg/reader/DmgInputStream; MethodParameters 	getLength 
Exceptions ' java/io/IOException #org.netbeans.SourceLevelAnnotations Ljava/lang/Override; b [B off I len 
SourceFile DmgInputStream.java !                    F     
*� *+� �              	          
 ! "     
    #        $      4     
*� �  �                    
 ! "          4     
*� �  �                    
 ! "   %     & (     )          ?     *� +�  �           "          ! "      * +  %     & #    *   (     )          U     *� +�  �           '     *     ! "      * +     , -     . -  %     & #    *   ,   .   (     )    /    0