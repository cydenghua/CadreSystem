object frmDataImport: TfrmDataImport
  Left = 0
  Top = 0
  Caption = #23548#20837#25968#25454
  ClientHeight = 714
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 912
    Height = 714
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    Properties.Rotate = True
    Properties.TabPosition = tpLeft
    Properties.TabWidth = 200
    ClientRectBottom = 710
    ClientRectLeft = 206
    ClientRectRight = 908
    ClientRectTop = 4
    object cxTabSheet1: TcxTabSheet
      Caption = 'Word'#26684#24335'_'#20219#20813#34920
      ImageIndex = 0
      object Label1: TLabel
        Left = 32
        Top = 288
        Width = 120
        Height = 13
        Caption = #23548#20837#20154#21592#21152#20837#25351#23450#21333#20301
      end
      object Label2: TLabel
        Left = 32
        Top = 336
        Width = 60
        Height = 13
        Caption = #25991#20214#36335#24452#65306
      end
      object cxRadioGroup1: TcxRadioGroup
        Left = 32
        Top = 32
        Caption = #23548#20837#26041#24335
        Properties.Items = <
          item
            Caption = #21333#20010#25991#20214#23548#20837
          end
          item
            Caption = #25209#37327#23548#20837'('#23581#35797#23548#20837#30446#24405#19979#25152#26377'word'#25991#20214#65292#35831#21247#25918#32622#20854#20182'word'#25991#20214')'
          end>
        Properties.OnChange = cxRadioGroup1PropertiesChange
        ItemIndex = 0
        TabOrder = 0
        Height = 97
        Width = 449
      end
      object cxComboBox1: TcxComboBox
        Left = 158
        Top = 285
        TabOrder = 1
        Width = 323
      end
      object cxRadioGroup2: TcxRadioGroup
        Left = 32
        Top = 160
        Caption = #35206#30422#26041#24335
        Properties.Items = <
          item
            Caption = #22995#21517#37325#22797#26102#35206#30422
          end
          item
            Caption = #22995#21517'+'#20986#29983#24180#26376#37325#22797#26102#35206#30422
          end>
        ItemIndex = 1
        TabOrder = 2
        Height = 105
        Width = 449
      end
      object Edit1: TEdit
        Left = 98
        Top = 333
        Width = 307
        Height = 21
        TabOrder = 3
      end
      object Button1: TButton
        Left = 411
        Top = 331
        Width = 75
        Height = 25
        Caption = #27983#35272
        TabOrder = 4
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 238
        Top = 472
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 5
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 385
        Top = 472
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 6
        OnClick = Button3Click
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Excel'#26684#24335'_'#24178#37096#34920
      ImageIndex = 1
      object Image1: TImage
        Left = 8
        Top = 8
        Width = 112
        Height = 80
        Picture.Data = {
          0D546478536D617274496D616765FFD8FFE000104A4649460001010100000000
          0000FFDB0043000B0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
          0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
          0D0D0D0D0D0D0DFFC0001108012C01A703002200011100021100FFC4001B0001
          0001050100000000000000000000000007010203050604FFC4004B1000010301
          0305080E07070501010000000001020304051112131622325215213335425462
          73061423314143516172748292A2D23453819193C2C32444636471A3F083A1B2
          C1E245D1FFC4001A010100030101010000000000000000000000020304010506
          FFC4002D11010002010203070403010101000000000001020311120413322122
          233142435224335162144172536382FFDA000C03000001110211003F00970000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000001ABABB4E9A9359FA7B1A2729536DD54D7E4AE85A537CD4A2AE6D28EE649
          E28B8491AD35B25B1451DFA6AEF44E1DB0D655BB5269317A46CA3B06B1FAEE64
          7EF14F3B2DFA31AAE6E4F4E36E5DD90537D5C9F09667153FD4CA7913B1D7F386
          FBA5F9B9FCCAFB83EA4F1DE8CE2A7FA994B738E1E6F2FDED31E6E339CBBDC68C
          DC673977B8D1F5278EBF38E1E6F2FDED19C90F3797E12CCDB673977B8D19B6CE
          72FF00707D41E3AFCE4879BCBF08CE4879BCBF09666DB39CBFDC299B6CE72FF7
          1A77EA0F1D933921E6F2FC2533921E6F2FDED2CCDB673A7FB8D299B4CE74FF00
          71A3EA0F1D933961E6F2FC2533961E6F2FDED2CCDA673A7FB8D19B3FCD7C03EA
          1CF1D7E72C3CDA5FBDA339A1E6D2FDED2CCD9673A7FE1B4A66CFF35F00D739F5
          0BF39A1E6D2FDED19CD073697E12CCD8FE6BE0299B1FCD7C0775CE7D42FCE783
          9B4BF08CE7839B4DF098F3619CE9FEE3466BFF0035FDB1AE73EA17E7441CDA6F
          8467441CDA6F79A599AECE76FF00C3694CD6FE6FFB677C63EA1933A20E6D37C2
          533A60E6D37C2599ADFCDFF6CA66AFF37FDB1E31F50BF3A60E6D37C233AA9F9B
          4DF09666AC7CEDFF0086533563E76FFC33BE31F50C89D94D3DE9FB34DDFE89D6
          C52E558C7EDB317BC43B550F6AD5CB4F8B1E4A5C1DE253B3D7B845D530963B5A
          DD4961BDEFBB77A1B40017348000000000000000000000000000000000000018
          279E3A78DD248ED1B8E0BE49591315F2391AD38BAFB6A4971474DA11DEED3DA3
          5F5F684B5D2AB52FC9DFDCD86DECDB17566AB4D9C1118ED7BE5B6CC7D2CB37B6
          4EED3A5A6A4B3EAAB9DD1BF8479D6D358F494F7636E564E9A9B5BDB1B7031134
          4C57AF94B298694FDEC9D71D69FBD99713189A0D2DCA3BCC6305CB355F8DDE52
          98DDB458038BB1BBCA31BB694B01CD5C5F8DDB4A531BB68B0A01931BF68A637E
          D18C0D5CD57E37ED0CA3F68B01C717E51FB4328FDA31941A9DAC9947ED0CA3F6
          8C606A76B2651FB4328FDA31941A9ACB2651FB4328FDA5318076B2651FB4328F
          DA310386B2CB947ED0CA3F694C400CB947ED29E985CED2C4A788F5D3F2BD924E
          D6515DA9C6957D792559DC045D5308D2D4E34ABEBC92ECEE022EA98431FB8AB0
          75E46D4005ED6000000000000000000000000000000000000B1EE6B1AE73B548
          F6D3AF7564CAC65F916BB0B3A5D23756E57616F6AC6EEB4F058B41967F6CC8DE
          E71AE818F2DA6F7E5519B24CDEDCBAB6164D9691B5B5350DD3D68D9B2DDA3A17
          BCABDC612FAD7657BAB22367760001274280A1C7000A070050A1C15280A07152
          80A015280A1C152850A07355C50A14382A0A140E2E05A00A82D005C54B00171E
          DA6E57B2784F6D2F2C94255EA4576AF1A55F5E499677011754C232B578D2AFAF
          F94936CEE022EA98471ABE1FAF336A002F6B0000000000000000000000000000
          00000F3D44CD821925D9638F41CBDBF518218E06AF08ED2217B6CA6E46F3B6B6
          972E89257D675B2FE62458E365340C899B2D397B029B4A4A9BBABFCC750F5D23
          3E0AE95DF3D57518A34AEE9EABAC39BB46DBDCE9F25251BDEDBBB9C9943A4351
          6AD036BE99CCF1D1A771F97DB2E9D7476FBB6F73A9A1CEA8F993FF0014675339
          93FF0014E21D1BA37B98F4D26B9CD76F1528DF6879FCFCBF276F9D2CE64FFC52
          B9D0CE66FF00C569C52175C467258E765F925BA1A88EBE9DB5112F834D9B1E91
          9FCA47B62DA0B435385DC04CADCA7E571244889BD23356EFF1C5F4B6FAB763BE
          FA6BEA60280A124D5280A5E9BEAAB7226FAAF90E0F2D5D5474703A691779BDE6
          DF72B9DB2D39ACE667337FE21A7B62D05ACA8C0C55C844B859D27729C690EE8C
          F6BCEBD8ECF3959CD1FF0088D299CACE68FF00C469C683A8EF7659CACE68FF00
          C469B1B3AD575A351918E95EC4BB13E457EF35A47AD6B9CE6B5ADC4E72B70B7A
          44AF6550B2CBA3FE3C9C2FF9D00B31EEBF9F4BD723123544C48BE5F318439CAE
          5552D212B175E50A008AA0B40150501C1505A540A9EFA4E59AF3DF49CB2554E9
          D48AED5E35ACEBFE524EB3B808BAA6118DABC6B59D7FCA49D677010F54C14F52
          1C3F5E66D4005CD60000000000000000000000000000000011DDB532CB5B26FF
          000785ADF7490FFF00C230AAEE95F275EDFF009193899EED59F3CF76B0EEACC8
          B23410FA18CF419113B846DE830C65F11B6B5859A691580A0281C715D9059DA5
          DBB0B7AEDEFEE1C7DC4C5231B231D1BD130B88CAD0A2751543A3DFC9B95CE89D
          772764CF921833E3D3BED6DC5F7175C64B8CF32CF10B2E3BFB06D0CB45DA933B
          BA3383F43FF070D719E191F048C963D7628A64D965F8ED34B6A935EDC0E52C2E
          A69D95D4CD959ADA3EFEC962DE9E0EF1B9BA740E62DCB4323176B44EEED2EBE1
          5D561B9ACAA651C0F99EA9F31184D33E795F2C8AAAE7A8537B310009A8003676
          6503ED0AA64497E4DAB8A57DDBD80111333A43A2EC6ECCC6EEDF9DBA1E277BBF
          FC43AD9A5C6EF44C9260A789B4F1261C2D69E22366BD36576C2A0B415A3AAA50
          A00E2A0B40355C0B4A0355E0B05E0D579B0A3E5FB26B2FF3A1B1A254EE9EC92A
          F5254EA4596AF1AD67AC127D9BC043D5308C2D6E35ACF5824FB378087AA61DA7
          523C3F5E66D8005CD800000000000000000000000000000000B5DAAA463FFD04
          F5AFD424E76AFBC4631F18B3D6FF00319388F6D9B37B6921FA8DF64C07A24D53
          CE685AA0050E221ABB4A8DB594EE6DDDD588E744EE96C9B3284662261C988B46
          928B158E63958E4D26AE9175C74F6C50EFF6D46DEB7E639E443CEBEB4B68C16A
          4D6745B84BEE2EB8C9714C90D95975AB4736970322F74FCAE3B699A9872AD54C
          3FE6911CDC7BAA6D4A88ECD5A66DF8B135994BF562D935F0F97DB68A5F6D6D5B
          3536BD7F6E4F8235EE116AF48D2006E520000B9AD73DCD631349CBA24AD6650B
          2CBA3FE3C9C21CE763766E3776FCEDD06E2C8EF77FF8874D5152D7BBBFAA35DA
          D1488A577CF528E72B9CAE2D3CAB3747FDCC6B338A26519B3DA5B89BE535EAF7
          6D296DEBE51B919BBDEB2B3690C6B334F11423ACA3BE5ECCBF44B32EEF221E60
          71CDCCF967F98B72AFDA53081ACB9ACB2E376D294C4EF2FF00B98C1C192F5F29
          BAB2FC77B2684DE595E3BD82CC7D6B30CF89546B6B71B567AC128D9BC043D530
          8B6D6E36ACF58252B378087AA616D3AACB387EBCCDB000B9B000000000000000
          0000000000000000016BB57EC7118C7C651FAE7E624E76AFD8E2318F8CA3F5CF
          CC64E23DB66CDEDA4997C0798F44BC93CE685B216952D228850A940E2D735AF6
          B98E4D64388ABA57534CACE4397B99DC18AA689B574CEDEEE9E2F78A7363DF5F
          F0AEF4DFE4E12E325C5EAC731CAC7269355CD2EB8F226746785B7147468E6E17
          790CD7798BAE23AE92968E52689D0BD58BECF9CC274B574E9347DED36EAFCA73
          5BE97A2A5CA9DF43D9C1963253F6A2131A06CECDA17DA154C85A8B835A57ECB0
          D6B5AE7391AD4D272E8B7A44A367D2C763D0637F0F2697B65EB295DD3ACF4D1E
          BA97B29A1652C3A3A2D34E795D5323DEAF7DCEC4A5D9661977EF2F6ED66285B7
          A77D1514A1CD55EAA8BCB4A1C71716942978D5C5C0B0A0D5CD57831DE00C80C7
          780329BDB27C77B073C6FEC7F1FEC1663EB5D87EE237B5F8DAB3D6094ACDE021
          EA984596BF1B567AC129D9BC043D530BE8B787EBCCDB000B5B00000000000000
          00000000000000000016BB57EC7118C7C651FAE7E624E76AAFB4463171947EB9
          F99C64E23DB66CDEDA489B92798F4CDC93CA685BFDA801422805014382BE14FE
          A6CDA9A2878616E9FA26C0B2B0B29F972F6BD1EFF6CC6DEB7E639FB8ECED4AC8
          68A8E6965BB57419B6E384A4A96D5478F7B15FA6CD93CBE2F16CF12BD3766C9B
          62FA7A9ECB8BAE2E2F3CC9458AE39FB429B02E5989A37E9FCC74A627B1AF6AB5
          C85D872F2EE8E8A763766651DDBF33742FEE3BDFDC3BE9618E6E1188F3C940F8
          9D4D1E4AE660E46C9B03E86B35BD7F5BB652BB68D0CD63C5BF917AB0D1CD66D5
          437E863F40EE8155B0D11B61A234BDEC5F0B4BD27772BEF3BE9A929E6E122629
          A49EC362DEE82456F41FBE53C9BD59ED86D1FBB449333CA64BD3BE8B7A1867B3
          AAE0BF144AE6ED30D7E37B17BEA8573AC79D544C4D7CDB4287852A3690CED999
          B4871066285A038B816DE2F06AB8168BC0B8E86C6F1FEC1CE1D158BE3FD82DC5
          D755D867C4AA38B5F8DAB3D60952CDE021EA584556BF1BD67AC12AD9BC043D4B
          0D0BF87FB999B60016B6000000000000000000000000000000002D76AAFB4461
          171947EB9F99C49EED5522F8B8CA3F5CFCCE326766CDEDA4A9B92794F4CDC93C
          A5F2B242D2A516E4DF55B908A2185CF42D748BBE89BC9E530B5B8DED6ED29C99
          FC2133F86E295AB93C4E3D2E7235AAE72EA86A616A34E27B26B5B211F68C0EEE
          92F0DADA0CFF00D96C762DBDE3163DCE52DFB4DD68552B18EFD9E073991F4B4B
          58D4D1552D2CC8EDFC1CB3C65085EB17ADAB6F5BC49C96B5F7CA4662A39A8E6A
          A2B5C97A2A785A65398B2AB3F76917AA3A53E7B363E5DECF4297DF55C632EBCB
          14AD27B28AA969A5FE1BF5F7FE23B34547223BC1711DA9D1D93598BF669174BC
          59EAF079B6F8765B8EFE997440A21665197F7CF55A5900FE8005C9E1B8F04D41
          4B3DF94859EE9EF07347263F2E4A7B03BEEA7957D07A7E639FA8B3EAE9AFCA44
          E54DB66FA12694BBCC853C9516E1E8895257B16E472A5DE053336AB69A485516
          5D1D46BC4D6BB6D984E76A3B1D7EFF006B4BEF954E1B335B87BFF5DF69DB2B1D
          CA4321E09E86AE997BAC2F6A5FAFE0F84F2B66919CA2AD19FB6BE6DC95BCD736
          AD396D3D2D958FE52114757A0E8EC4F1FEC1CC9D3587FBC7B0598BEE557E09F1
          6A8E6D7E37ACF58255B378087A96114DAFC6F59EB04AD66F010F52C35B470FF7
          3336C002C6C000000000000000000000000000000005AED5F788BA2E338FD73F
          3128BB57DE22E8B8CE3F5CFCC65CFE78D9B3F9E34953724F29EA9F92789CE42E
          596F3555C8D3CAE7285555DF5531A95CCA999D543D946CC4F57EC9E23734ED48
          A0C5BDB6769D4ED3AB561B46B59414B24CFF00F4FA442F3CB2544B24D2AE9C8E
          73BFF27456DDA0B5F5385B7E42157363E96D38E7F089BEB2C5C464DF6D3D3479
          30969E9B8C6AD3BB9934636B9CD7239ABA4D53B7A3AA6D4C2DDAF19E91C4A35C
          E7235A97B9CB725DE1712B50588DA7B372777ED326195CFF006754A388C31969
          AFAA8D3C356F69B69D2D55E5A5AB7A2AB56FBDAA5979E369DAD2ADE58D91D1BD
          AF62AA39AA5B798AF26E244A3AA6D5C1946EB5C6175FBFE5390B3AB5692A1312
          F729345FF31DC491E534D976921ED61C9CCA7ED46AADB7D5E5491EDE5195B577
          6BB4F33D1DCA4302966B26B30DD3268DFCA331CD297B6AA58F94A777BB193F2E
          881AA8ED166F651AAD364C9192353012D625645A2CBC004925AAD6BB59A97748
          D4D4D8F4553E292376DC48D61B807348466B5B79D5C05576373334A9A5CAF42E
          39B9A96A699CB9589ECFF369A4C658E8D8F45C6D6B8AB94CD7E1A96E9EE21C65
          4C8CE51D5D896944CCB656F662561BCAAB0A86A6FD0C8F566952C1A8A659326F
          6CCDD1F4C8C639AD95570E4C77ADBADC4DAAF6BED5AB7B17C7FCA4B366F010F5
          2C21DB4209A1AD972B1BF86D9261B37E8F0F52C2DAFA9670FD791B700136C000
          000000000000000000000000000005AED55F688B62E338FD73F31293B57EC711
          6C5C691FAE7EA1973B2E7F6D2454AE8B7FA9ADF2EF9B1ABD46FA46B0B2DE695F
          CD42D2A58415AF8DB8E46B7CE78ADFB4323176942BA7237BA7A07B32ECA4865A
          97F93B99C1CCF7CF2BE591749EE710BDF657F6BA37B6DA76755DE0C25984F561
          31DC5316629796E312A1EAB8F6D9F42EAEA9643F8BBE5D59ED462B369D21BDEC
          6EC9CA3FB7E66E8B381F74910C30B618626451E1C2C6B7C264C6CDA435443D7C
          54AE3A6D7336BD27EF31A6CE50E6AF2499236C8D732EF011F57533A8E7747BF8
          7C59E6F13876DB7D7A6EAB35749DCF22A98D4B6F2CBCC9A336A2A9D858768636
          F6A4AEEA8E2943257C4F6C91AE931C68C56D962979A5B54BEA89E1B8F2C94B1B
          BCA61B3AB595D4ED9795AB27A66C4F57A9E9776FDAD249492B75531FDBBE6B9C
          8A9E05FB8EB0C4F8A3935DA9F7119A2B9C6E4B7D570A7296E3AA823C8C2C6744
          F325044D95B236FEF99AB1EE8E9E4C28B8B0E1EF1CAC6DDDAB94ACD374CB4B25
          A923277E146BA3C5E43DD0DAB4CFD7BE377FB1C9BAFDFBD2E5F0DE617156FB44
          A8E75EB2919AF63D130BB17DA5E46CCA89A1E0A4730DAC36ECB1DD97663F409C
          66AAD8E22B3D5DC7680D553DAB4751AB260E83CDA22A798B62627C97C5AB6F2B
          2A0024931490C5368C91B1FEC9815B1C1870DFDFFF00309EC3592AAC93A37643
          8D8B5778B8B5A9BC5C1D000000000000000000000000000000005AED5711645C
          691FAEFEA129BB55C457171A47EBBFA865CFEDB2E7F6D2455EAB4D69B2ABD461
          AD2764AFD4B14B15537FCDBEA5E6AAB66C29926AEB6B955EF1454D6D7542D43D
          18DE0E2C587E635984F5612DC279DBF74AA9879150C6A87A950C4A84F72BD1E4
          542CD26DF85CE6FA2E3D0A861717555B02BE4FAC93DF71856492FE124EFEDB8C
          CE30AFFD9A6A86BDA9D59A8DF64D75A547DB94EBF58DE0CD8B5741BE8B4BAF34
          CC775EDE916AF6A247626B95AE4B9CD5D2F48C579D65BD4187F6C89BBDA2D99B
          F98E36F3CABE39A59E65EB34B692B954C6AA52F2CBC2A6E2CAB45682A53BF919
          3852499667358D963B9F1FF9A4432775D8EDA492B3B42776969647D03661B4F4
          B4E0CBA7872EAA3AD89DAC7B11CD7268A9CDD4C2B0BD5BC95D53140E972AC646
          F75F89A5DBE756A8C93AE9357560B1CE48D8AF72EAB4F2C55D4F36ABCB16AB35
          1D3CFAEC3475162BFF0077910EA01C9A56DE68DA94BF9D51ACF4B5105F9589C8
          6BDC4B0AD6BB59A86A2A6C7A4A8E464FD033DB0FC59AFC3CFA6C8DDC7A60B46A
          E9782957D07E99B8AAB02AA3BF22E499BF19A04A59B2F1C0F8DF8DEF6F24A7BF
          4649AE5A5BE092ACBAA9AB295B34CC6B3F31B53CF4F0B608228BEAE369E83747
          A5EB535DB5D7A986799B04324CFF0014C71AFA3EEBDD7CD8CD3F6535990A1ED7
          BF4EA5EDF73134DBD9BF4787A961DD7B5CDDDFB57E0DB800EA60000000000000
          0000000000000000000B5DABF6388AA2E348FD77F50955DABF6388A62E348FD7
          7F50CD99973FB692AAF5586B0D9566AB0D6124AFD4F3CD2A44C571CFBAF7B95C
          EE529BD9A9F2CE4D35F44F636C68F0A7757DFEC987363CD96C8457779394B8B2
          E3AFDC58BEB5E5BB8717D749F0957F1731CAB38C5FE86171DB2D8317D749F096
          2F63D0FD7CBF0FC859FC7CD08F26EE194C0E3BD5EC721E712FDCDF90B57B1A83
          9C4DF737E42EE4E457C8C9F1478E30BBFEC9157B16A7E7337F6FE42CCD4A7E73
          37F6FE42E8C77843F8F95D7F8A6FB2232E56E8E1F334B91378D2F49E79F039AB
          1BDB89AF422CB4695D4750E8FC5BB8224B91DA4A6AAB68E2AD8D1922E1C2BA2F
          694E4AEF867CD4DF1D9D48D6F2CBCEC57B1F839C4BF0FC859B814D7E9544DF73
          7E43372D8A70E471F788A67C323258DCAD7B1C770DEC6E8A4FDF26FEDFC866CD
          2A6E7537F6FE42CE5BBFC7CCDC5254476BD13646F0CDF85E66A1A67C723DF237
          C184F2D9B6236CD95D2455333F6D8FC3F21D19A621BE959D2BBFA9A7B526C10A
          47F58A726AA76D5347154EBDE8EDA453413D933F8AEE85778B2BCB5BF9B5D156
          D4C1A927B2E36D0DB8DFDE235F4D873D2C7246BDD18E61E4714C5ED551192F4F
          524986B29AA38295A7AC89712A2E8AAA7DA6C20B66B69F97956F4CB23347A975
          7898F5D525162C6C72A3B0A68A9CD5376454D2E8CED742ED1F40E99AE47351DB
          45F16ADFC9A6B7A5E3BB6DEB80314D264A27C9D1249223EC9AB16A6D4C972297
          B97B78892ECDFA3C3D4B0862B9CAFB46A1FF00C777FC899ECDFA3C3D4B08C79D
          99704EEC99A5B600126B000000000000000000000000000000005AED5FB1C453
          171A47EBBFA84ACED5FB1C451171AC7EBBFA867CCCB9FDB49559A8CF48D59B4A
          CD467A46AD4EDDDBF53353B31CADE8A9BD35F46CD173F694D81653B216E38D2A
          0009AC00000B6F2A5871C5D88B8C05B7A87357A416B6FC37A8C4DBFBE7525AE8
          D9E43CAFA77720F7039A2330D1C8C7B359AA7994E954F2494913FA3E890DAAE6
          8D029732A668B96A7AE5A295BA8A8F358F6B98AB89AA856ABBD56FA96B167760
          C1E03646AECE8B0C594FAC53C16ACEB8D91357574CB35DB55DBA766EB3A30719
          15A5530F2B19B786D8A77DCD95163708C959723351B79218E54EE8C471A3A8B0
          E9E4BDD0B96277F537AC96392EC0F6BCC84A6B5B2734A5E3B6A8E6AAC8AD82FD
          0CAF57F29A07DED5C2E4545E926F9329E2A8A1A6AA6AE5A26945B0EBD3665BF0
          B1E8B234B369BB6AB218FA4D7BC95D112EFB0D4D15954F412C9244AFEE9875F9
          26DC9E2A4D23B7A96E0C538EBDBD41A2B626C30B62BF8437A4795954B5368556
          CC3863F74B27B13CB6DB5FF6E12AFE9D375C4D166FD1E1EA5843159F4D9BAE26
          7B37E8F0F52C0CDC375E46D80049B8000000000000000000000000000000016B
          B557DA2278B8D63F5DFD425876AAFB444D171AC7EBDFA867CCC99FDB49959A8C
          35972AAA7F536759A8CF48F2D333BAA1298D6DA2768D6FA36D1B7031A5E01734
          7900000000052E2BBC00C4AC531E15BD137CF4838E2D554469AE72AAAAAF8554
          D839B89AA9BE78DF0BFCCA727572D0C492BDBE133B6ADBCB453C4EBD37951517
          CE861520AB768DE36463F55C86439ABD537D16E5F2A1999592C776F9D8BFE5DE
          647F6DF963E3649AED4FB8F0C75F13B5CF7B5CD7A68BBFDC9762C89AD846A35A
          8D6F7BC872959495594925C18F7CEB40B577397A6F8D11C3AF4BEF454FB2E302
          9224D4B04FC2468686A6C3EFF6BC9EF99ED8AD1E4C97C378F2EFB976CD2C4E4C
          9BDCCFB4DAC36F54C5BD37766FC66BEA28AAA9F8489DE9B11C6A9DE129D6F495
          1BB2527E09169ADAA3A8E5E4BACC26E5AE6B93590869C74FD8F24EFA977747E4
          626FB05D4CD369DB355F8B88B5AD5ADAA900006A6E782D0A84A5A3A89B66277B
          C46964A3AA67936A595A745D9555618A0A56AF08E73DFECE13C5D8A43DDAA25F
          AAC1FF0012899D72305EDBF88AD3E0E46D744DD6ABEBDBFF00125DB37E8F0F52
          C222B678E2B7D60976CDFA3C3D4B0B53E1FEE666D80049B00000000000000000
          00000000000000016BB55DED112C5C6B1FAF7EA12D3B55DED11245C6B17AF7EA
          19F332711EDA4EACD467A45D48CD0C5B4A2A915D93F4CF5B5B85A8D2DD3BCBF4
          EFEAB8004D6000005A5C500C65312975CA635228CAFCA194F3B1348CAF76169D
          355E0F0659FE533B6A19E739A9AC332B5AED643C72523790A7B51517C29F7953
          BA130D04B4F2B392AE3C2EBFBCB7A2F914EB4F3C94F14BC8421B154E3D7C9CA2
          9D3D1C59181BFE6B1E4DCD6E51AEC7A38AF3DF51264617BF7F54E563694ACD37
          4CB5535A7919DCCC18E3FEA7B21B469A5E5A33D338E72AAAADEBE13038AF9968
          953CEB44A484727950A91D45595307072B8DC416F2FEF11FB9849C65AADAE7A7
          F8758A897780D4D4D934753AD1E0E99E882BE96A383959F79EF2CEEDD6CC52FF
          00BB80AAEC76A23BDD4EF49BA1CB3A3B168DD474BDD1BDD64E10DE02118EB5B6
          E575C34A5F75400D55AB55DA943512FF000DC58B6DDDAD918DB353DB568CFBFC
          1BDD11D5F62ADEE753FE91C036F924F0DEE769122F635FBD7FA463ACF8CF270D
          B77115947D6CF1C56FAC12ED9BF4787A961115B3C715BEB24BB66FD1E1EA586B
          6CE1FEE666D80049B0000000000000000000000000000000016BB55DED11243C
          6D17AF7EA12DBB55DED10FB5ED8ED26C8F5D065639EFF79C51999388F6D2F2B3
          7D9FD4C868777ACCE7085777ECCE705ABF7E36F41A1DDFB2F9C0CE0B2F9C8777
          D1BE0683382CBE723382CBE720E653E4DF83419C165F3919C365F3907331FC9B
          F1721CFE70D97CE4670D95CE41CCC7F26F91A8609B17916E3519C56573919C56
          57391AD5C9BE39F53D6AD76CA98D5AFD95FB8F3E71593CE4671593CE5A47FF00
          A435C7FF00465EEBE47FDC7A195337D5B8F0E71593CE5A338AC9E7287634F911
          348F71BB8E66C9B5EE99CE7738AC9E728338EC9E72753E653FE8E882A2790E77
          38EC9E723392C9E7275DE663F9363359D4D372307A068A7B1E6F14ECA1ECCE4B
          279C94CE4B279C909AD155B936F3B398929AA6FE064F71C79DD4F51F5137E19D
          7E71D91CE5A338EC8E72D2AE4A8E5629F71C5642AAFE066F71C6C29EBAD7A6BB
          B9CD27A71B8E9338EC8E72D19C763F391CAFFD0E5D2B3DDCCD859D592D6458E6
          A7753E91B439CCE4B239C8CE4B239D17C3545E9A76E4DEE8CE0BB2AA87770A46
          22FD649F94DD672591CE8C2FB7AC2C5A72C5F8672FDE432CD6F4B56326C4774F
          1BB7DD857EE3BDEC6D17F6ADEFAA32EEDD81B70FE117B2DFB123E0E667B8515C
          5DF65C787664ADF9D8D1A5B3C715BEB24BB66FD1E1EA5843B694D1D45A753344
          EC71CB3130D9BF4787A961A16F0FF73336E0024DA00000000000000000000000
          000000000B5DDE522CA9B2EA32F33B13151D23D53DE255539E7B5B8DDE938AEF
          1F9539695BED701B9751D01B9751D03BFC8B0645857B1472688FF72EA3A05372
          AA3A048191679C6459E73BB0E4D11F6E5547406E55474090722CF394C8B3CE36
          1C9C68FB726A3CAC29B9351D0242C8B3CE322CF38D953938D1EEE45479585372
          2A3A048791679C6459E73BB1CE4E3477B9151D029B8F51E56122E458322C1B20
          E4E3475B8F53E5614DC7A9E812364585322C3BB4E4E3475B8F53D029B8F53D02
          46C8B0A645836C1C9C68E771EA7A0371EA769848F91614C8B0EED3938D1C6E35
          4ED30A6E354ED3092322C19160DB07231A37DC6A9DA60DC5A9DA61246458322C
          3A7231A36DC5A9DA60DC5A9DA612464585322C07231A37DC5A9DA60DC5A9DA61
          24E458322C07231A35DC4A9DA60DC4A9DA6124E458322C07231A36DC4A9DA60D
          C4A9DA612564585322C07231A36DC5A9DA60DC4A9DA6124E458322C07231A386
          D8B53893499C9259B398EC8C7D5B0D4E06E23A385130B7D169D885F8695A6EDA
          F400092F00000000000000007FFFD9}
        Stretch = True
      end
      object Label3: TLabel
        Left = 120
        Top = 39
        Width = 396
        Height = 25
        Caption = #20174#35760#24405#24178#37096#20449#24687#30340'EXCEL'#34920#26684#20013#23548#20837#25968#25454
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 40
        Top = 117
        Width = 89
        Height = 19
        Caption = '1'#12289#36873#25321#25991#20214
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 40
        Top = 157
        Width = 89
        Height = 19
        Caption = '2'#12289#23548#20837#33539#22260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 55
        Top = 197
        Width = 48
        Height = 19
        Caption = #24320#22987#34892
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 198
        Top = 197
        Width = 48
        Height = 19
        Caption = #32467#26463#34892
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 169
        Top = 197
        Width = 24
        Height = 19
        Caption = '-->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 40
        Top = 245
        Width = 153
        Height = 19
        Caption = '3'#12289#23548#20837#21518#21152#20837#21333#20301#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 526
        Top = 249
        Width = 140
        Height = 13
        Caption = '('#20026#31354#34920#31034#19981#21152#20837#20219#20309#21333#20301')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 40
        Top = 293
        Width = 169
        Height = 19
        Caption = '4'#12289#35774#32622#23383#27573#23545#24212#20851#31995#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Edit2: TEdit
        Left = 133
        Top = 113
        Width = 394
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Button4: TButton
        Left = 546
        Top = 111
        Width = 79
        Height = 30
        Caption = #36873#25321
        TabOrder = 1
        OnClick = Button4Click
      end
      object cxSpinEdit1: TcxSpinEdit
        Left = 108
        Top = 196
        Properties.MaxValue = 999999.000000000000000000
        Properties.MinValue = 1.000000000000000000
        TabOrder = 2
        Value = 1
        Width = 53
      end
      object cxSpinEdit2: TcxSpinEdit
        Left = 249
        Top = 196
        Properties.MaxValue = 999999.000000000000000000
        Properties.MinValue = 1.000000000000000000
        TabOrder = 3
        Value = 1
        Width = 53
      end
      object Edit3: TEdit
        Left = 199
        Top = 242
        Width = 321
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object cxGrid1: TcxGrid
        Left = 55
        Top = 322
        Width = 570
        Height = 257
        TabOrder = 5
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSource1
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1db_field_name: TcxGridDBColumn
            Caption = #23646#24615#23383#27573
            DataBinding.FieldName = 'db_field_name'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 276
          end
          object cxGrid1DBTableView1excel_field: TcxGridDBColumn
            Caption = 'Excel'#21015#20301#32622
            DataBinding.FieldName = 'excel_field'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.DropDownListStyle = lsEditFixedList
            HeaderAlignmentHorz = taCenter
            Width = 180
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object Button5: TButton
        Left = 424
        Top = 599
        Width = 79
        Height = 30
        Caption = #30830#23450
        TabOrder = 6
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 546
        Top = 599
        Width = 79
        Height = 30
        Caption = #21462#28040
        TabOrder = 7
        OnClick = Button3Click
      end
      object Button7: TButton
        Left = 223
        Top = 287
        Width = 99
        Height = 30
        Caption = #20445#23384#23545#24212#20851#31995
        TabOrder = 8
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 346
        Top = 286
        Width = 105
        Height = 30
        Caption = #21021#22987#21270#23545#24212#20851#31995
        TabOrder = 9
        OnClick = Button8Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Ctl3D = False
    Left = 80
    Top = 216
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 392
    object ClientDataSet1db_field: TStringField
      FieldName = 'db_field'
      Size = 50
    end
    object ClientDataSet1db_field_name: TStringField
      FieldName = 'db_field_name'
      Size = 50
    end
    object ClientDataSet1excel_field: TStringField
      FieldName = 'excel_field'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 566
    Top = 393
  end
end
