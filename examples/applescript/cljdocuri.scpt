FasdUAS 1.101.10   ��   ��    k             i         I     �� 	��
�� .GURLGURLnull��� ��� TEXT 	 o      ���� 0 this_url this_URL��    k     � 
 
     l     ��  ��    K E When the link is clicked in thewebpage, this handler will be passed      �   �   W h e n   t h e   l i n k   i s   c l i c k e d   i n   t h e w e b p a g e ,   t h i s   h a n d l e r   w i l l   b e   p a s s e d        l     ��  ��    5 / the URL that triggered the action, similar to:     �   ^   t h e   U R L   t h a t   t r i g g e r e d   t h e   a c t i o n ,   s i m i l a r   t o :      l     ��  ��    B <> yourURLProtocol://yourBundleIdentifier?key=value&key=value     �   x >   y o u r U R L P r o t o c o l : / / y o u r B u n d l e I d e n t i f i e r ? k e y = v a l u e & k e y = v a l u e      l     ��������  ��  ��        l     ��  ��      EXTRACT ARGUMENTS     �     $   E X T R A C T   A R G U M E N T S   ! " ! r      # $ # l    	 %���� % I    	���� &
�� .sysooffslong    ��� null��   & �� ' (
�� 
psof ' m     ) ) � * *  ? ( �� +��
�� 
psin + o    ���� 0 this_url this_URL��  ��  ��   $ o      ���� 0 x   "  , - , r     . / . n     0 1 0 7    �� 2 3
�� 
ctxt 2 l    4���� 4 [     5 6 5 o    ���� 0 x   6 m    ���� ��  ��   3 m    ������ 1 o    ���� 0 this_url this_URL / l      7���� 7 o      ���� 0 argument_string  ��  ��   -  8 9 8 r    ! : ; : m     < < � = =  & ; n      > ? > 1     ��
�� 
txdl ? 1    ��
�� 
ascr 9  @ A @ r   " ' B C B n   " % D E D 2   # %��
�� 
citm E l  " # F���� F o   " #���� 0 argument_string  ��  ��   C o      ���� 0 these_arguments   A  G H G r   ( - I J I m   ( ) K K � L L   J n      M N M 1   * ,��
�� 
txdl N 1   ) *��
�� 
ascr H  O P O l  . .��������  ��  ��   P  Q R Q l  . .�� S T��   S   PROCESS ACTIONS    T � U U     P R O C E S S   A C T I O N S R  V W V l  . .�� X Y��   X I C This loop will execute scripts located within the Resources folder    Y � Z Z �   T h i s   l o o p   w i l l   e x e c u t e   s c r i p t s   l o c a t e d   w i t h i n   t h e   R e s o u r c e s   f o l d e r W  [ \ [ l  . .�� ] ^��   ] F @ of this applet depending on the key and value passed in the URL    ^ � _ _ �   o f   t h i s   a p p l e t   d e p e n d i n g   o n   t h e   k e y   a n d   v a l u e   p a s s e d   i n   t h e   U R L \  `�� ` Y   . � a�� b c�� a k   < � d d  e f e r   < B g h g n   < @ i j i 4   = @�� k
�� 
cobj k o   > ?���� 0 i   j o   < =���� 0 these_arguments   h o      ���� 0 	this_pair   f  l m l r   C H n o n m   C D p p � q q  = o n      r s r 1   E G��
�� 
txdl s 1   D E��
�� 
ascr m  t u t s   I ] v w v n   I L x y x 2   J L��
�� 
citm y o   I J���� 0 	this_pair   w J       z z  { | { o      ���� 0 this_key   |  }�� } o      ���� 0 
this_value  ��   u  ~  ~ r   ^ c � � � m   ^ _ � � � � �   � n      � � � 1   ` b��
�� 
txdl � 1   _ `��
�� 
ascr   ��� � Z   d � � ����� � =  d g � � � o   d e���� 0 this_key   � m   e f � � � � �  a c t i o n � Z   j � � � ��� � =  j o � � � o   j k���� 0 
this_value   � m   k n � � � � �  1 � Z  r � � ����� � =  r | � � � n  r z � � � I   s z�� ����� 0 run_scriptfile   �  ��� � m   s v � � � � � * A c t i o n   S c r i p t   0 1 . s c p t��  ��   �  f   r s � l 	 z { ����� � m   z {��
�� boovfals��  ��   � R    ����� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � m   � ���������  ��  ��   �  � � � =  � � � � � o   � ����� 0 
this_value   � m   � � � � � � �  2 �  � � � Z  � � � ����� � =  � � � � � n  � � � � � I   � ��� ����� 0 run_scriptfile   �  ��� � m   � � � � � � � * A c t i o n   S c r i p t   0 2 . s c p t��  ��   �  f   � � � l 	 � � ����� � m   � ���
�� boovfals��  ��   � R   � ����� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � m   � ���������  ��  ��   �  � � � =  � � � � � o   � ����� 0 
this_value   � m   � � � � � � �  3 �  ��� � Z  � � � ����� � =  � � � � � n  � � � � � I   � ��� ����� 0 run_scriptfile   �  ��� � m   � � � � � � � * A c t i o n   S c r i p t   0 3 . s c p t��  ��   �  f   � � � l 	 � � ����� � m   � ���
�� boovfals��  ��   � R   � ����� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � m   � ���������  ��  ��  ��  ��  ��  ��  ��  �� 0 i   b m   1 2����  c l  2 7 ����� � I  2 7�� ���
�� .corecnte****       **** � o   2 3���� 0 these_arguments  ��  ��  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 run_scriptfile   �  ��� � o      ���� 0 this_scriptfile  ��  ��   � k      � �  � � � l     �� � ���   � / ) This handler will execute a script file     � � � � R   T h i s   h a n d l e r   w i l l   e x e c u t e   a   s c r i p t   f i l e   �  � � � l     �� � ���   � 5 / located in the Resources folder of this applet    � � � � ^   l o c a t e d   i n   t h e   R e s o u r c e s   f o l d e r   o f   t h i s   a p p l e t �  ��� � Q      � � � � k     � �  � � � r    
 � � � I   �� ���
�� .sysorpthalis        TEXT � o    ���� 0 this_scriptfile  ��   � l      ���~ � o      �}�} 0 script_file  �  �~   �  ��| � L     � � l    ��{�z � I   �y ��x
�y .sysodsct****        scpt � o    �w�w 0 script_file  �x  �{  �z  �|   � R      �v�u�t
�v .ascrerr ****      � ****�u  �t   � L     � � m    �s
�s boovfals��   �  � � � l     �r�q�p�r  �q  �p   �  ��o � i     � � � I      �n ��m�n 0 load_run   �  � � � o      �l�l 0 this_scriptfile   �  ��k � o      �j�j 0 this_property_value  �k  �m   � k     / � �  � � � l     �i � ��i   � ; 5 This handler will load, then execute, a script file     � � � � j   T h i s   h a n d l e r   w i l l   l o a d ,   t h e n   e x e c u t e ,   a   s c r i p t   f i l e   �  � � � l     �h �h    6 0 located in the Resources folder of this applet.    � `   l o c a t e d   i n   t h e   R e s o u r c e s   f o l d e r   o f   t h i s   a p p l e t . �  l     �g�g   7 1 This method allows you to change property values    � b   T h i s   m e t h o d   a l l o w s   y o u   t o   c h a n g e   p r o p e r t y   v a l u e s 	 l     �f
�f  
 1 + within the loaded script before execution,    � V   w i t h i n   t h e   l o a d e d   s c r i p t   b e f o r e   e x e c u t i o n ,	  l     �e�e   7 1 or to execute handlers within the loaded script.    � b   o r   t o   e x e c u t e   h a n d l e r s   w i t h i n   t h e   l o a d e d   s c r i p t . �d Q     / k    %  r    
 I   �c�b
�c .sysorpthalis        TEXT o    �a�a 0 this_scriptfile  �b   l     �`�_ o      �^�^ 0 script_file  �`  �_    r      I   �]!�\
�] .sysoloadscpt        file! o    �[�[ 0 script_file  �\    o      �Z�Z 0 this_script   "#" O    $%$ r    &'& o    �Y�Y 0 this_property_value  ' o      �X�X 0 some_script_property  % 4    �W(
�W 
scpt( o    �V�V 0 this_script  # )�U) L    %** l   $+�T�S+ I   $�R,�Q
�R .sysodsct****        scpt, o     �P�P 0 this_script  �Q  �T  �S  �U   R      �O�N�M
�O .ascrerr ****      � ****�N  �M   L   - /-- m   - .�L
�L boovfals�d  �o       �K./01�K  . �J�I�H
�J .GURLGURLnull��� ��� TEXT�I 0 run_scriptfile  �H 0 load_run  / �G �F�E23�D
�G .GURLGURLnull��� ��� TEXT�F 0 this_url this_URL�E  2 �C�B�A�@�?�>�=�<�C 0 this_url this_URL�B 0 x  �A 0 argument_string  �@ 0 these_arguments  �? 0 i  �> 0 	this_pair  �= 0 this_key  �< 0 
this_value  3 �; )�:�9�8�7 <�6�5�4 K�3�2 p � � � ��1�0�/ � � � �
�; 
psof
�: 
psin�9 
�8 .sysooffslong    ��� null
�7 
ctxt
�6 
ascr
�5 
txdl
�4 
citm
�3 .corecnte****       ****
�2 
cobj�1 0 run_scriptfile  
�0 
errn�/���D �*���� E�O�[�\[Z�k\Zi2E�O���,FO��-E�O���,FO �k�j kh ��/E�O���,FO��-E[�k/EQ�Z[�l/EQ�ZO���,FO��  x�a    )a k+ f  )a a lhY hY O�a    )a k+ f  )a a lhY hY )�a    )a k+ f  )a a lhY hY hY h[OY�U0 �. ��-�,45�+�. 0 run_scriptfile  �- �*6�* 6  �)�) 0 this_scriptfile  �,  4 �(�'�( 0 this_scriptfile  �' 0 script_file  5 �&�%�$�#
�& .sysorpthalis        TEXT
�% .sysodsct****        scpt�$  �#  �+  �j  E�O�j W 	X  f1 �" ��!� 78��" 0 load_run  �! �9� 9  ��� 0 this_scriptfile  � 0 this_property_value  �   7 ������ 0 this_scriptfile  � 0 this_property_value  � 0 script_file  � 0 this_script  � 0 some_script_property  8 ������
� .sysorpthalis        TEXT
� .sysoloadscpt        file
� 
scpt
� .sysodsct****        scpt�  �  � 0 '�j  E�O�j E�O*�/ �E�UO�j W 	X  f ascr  ��ޭ