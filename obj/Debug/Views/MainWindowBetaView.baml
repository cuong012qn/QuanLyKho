   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5   	   ;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5
   	   -    'QuanLyKho_MVVM.Views.MainWindowBetaView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   (ucclr-namespace:QuanLyKho_MVVM.UC  5   	   .local"clr-namespace:QuanLyKho_MVVM.Views  5
   	   -   5        $��mainView��5	   	     � WindowStartupLocation$  CenterScreen=�5
   :    � WindowStyle$
 None=�6_   $��20(�5       � 
ResizeMode$ NoResize=�6(      
MainBetaVM � DataContext# [  6>    � Title$ MainWindowBetaView��5   	   $	��900��6$   $
��1000��61   .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedWindowCommand+	   CommandParameter	 5   $   �� 
 �� ElementName$
 mainView��5      .��5      )  #MaterialDesignThemes.Wpf.DialogHost     
Identifier$ RootMainWindow��6    .��5   
   ]� .+�5         QuanLyKho_MVVM.UC.UCBar  $	��Top=�6   6.   (  "MaterialDesignThemes.Wpf.ColorZone  5         Mode$ Light=�6'      CornerRadius$ 3��65   +  %MaterialDesignThemes.Wpf.ShadowAssist   ShadowDepth$ Depth3=�6F   $��2q�6w   $
��Left=�6�   $��Stretch=�6�   .��5      9� -   5        $��ExMain��5   2    9� ExpandDirection$
 Left=�6   ��5      �� 5      $
��Wrap=�6$   $��Chức năng��68   6K   .��5      �� .��5      ��  � 	Resources 5       �� 
TargetType # MaterialDesignRaisedLightButton �� BasedOn �� Property �� Value��%�   '��       7  �� 5   "   " ��6(   8   .�5   &   ��  � ��$ 75��6?   6L   �� 5    &    � ��$	 125��6>   6L   �� 5!   &    � ��$ 5q�6?   6K   �� 5"   &    � ��$ 20(�6A   6N   5#   #   5$      .+�5%      �� -   5        $��Trang chủ��5%   %   6O   �� 5&      -   5        $��
Nhập kho��5&   %   6O   �� 5'      -   5        $��
Xuất kho��5'   %   6P   �� 5(      -   5        .��5)   "   �� $
��Wrap=�6,   $��Khách hàng��6@   6T   5*      �� 5+      -   5        .��5,   "   �� $
��Wrap=�6,   $��Nhà cung cấp��6@   6V   5-      �� 5.      -   5        .��5/   "   �� .+�50   &   �� $��
Đơn vị��60   6@   51   #   52      �� 53      -	   5        .��54   "   �� .+�55   &   �� $��Mặt hàng��60   6B   56   #   57      58      59      5:      5;      #	  MaterialDesignThemes.Wpf.Card	  5<      $��Stretch=�6"   $��Stretch=�6@   .��5=        $
 Root��6,   .��5>      >� -
   5         >�Name$ UCSpace��5>   "   65   5?      5@      5A      5B      5C      