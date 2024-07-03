---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_17 begin
        state start begin
                when login or levelup with pc.level >= 27  and pc.level <=30 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20021)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Razbunarea lui Ariyoung")
                        end
                end

                when __TARGET__.target.click or
                        20021.chat."Razbunarea lui Ariyoung"  begin
                        target.delete("__TARGET__")
                        say_title("Ariyoung:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("A trecut mult timp de cand sotul meu a")
                        say_verde("fost ucis, nu stiu cine a facut asta.")
                        say_verde("")
                        say_verde("Ma ajuti sa ma razbun? ")
                        local s=select("Sigur, te ajut","Nu am timp")
                        if 2==s then
                                say_title("Ariyoung:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Ariyoung:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Ariyoung:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ariyoung:")
                        say_verde("")
                        say_verde("Multumesc, du-te la magazinul general!")
                        set_state(to_itemmall_owner)

                end

        end

        state to_itemmall_owner begin
                when letter begin
                        local v=find_npc_by_vnum(9003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Negustoare")
                        end

                        send_letter("~Lv 27 - Du-te la Negustoare")
                        q.set_icon("scroll_open_golden.tga")
                end
                when info or button begin
                        say_title("Du-te la Negustoare")
                        say_verde("")
                        say_verde("Negustoarea de diverse are informatii")
                        say_verde("despre sotul ucis al lui Ariyoung.")
                end



                when __TARGET__.target.click or
                        9003.chat."Razbunarea lui Ariyoung"  begin
                        target.delete("__TARGET__")
                        say_title("Magazinul General:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Cum, nu stie ce sa intamplat? Goe-Pae l-a")
                        say_verde("ucis cu sange rece chiar in fata satului.")
                        set_state(find_ariyoung)
                end
        end
        state find_ariyoung begin
                when letter begin
                        local v=find_npc_by_vnum(20021)
                        if 0!=v then
                                target.vid("__TARGET__",v,"Inapoi la Ariyoung")
                        end

                        send_letter("~Lv 27 - Inapoi la Ariyoung")
                        q.set_icon("scroll_open_golden.tga")
                end

                when info or  button begin
                        say_title("Inapoi la Ariyoung")
                        say_verde("")
                        say_verde("Ai aflat ce sa inamplat, du-te la Ariyoung.")
                end

                when __TARGET__.target.click or
                        20021.chat."Razbunarea lui Ariyoung" begin
                        target.delete("__TARGET__")
                        say_title("Ariyoung:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Ce... nu imi vine sa cred ce imi zici!")
                        say_verde("")
                        say_verde("Nu stiu ce am sa ma fac acum *plange*.")
                        wait()
                        say_title("Ariyoung:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Razbunare! Vreau razbunare! Ajuta-ma sa")
                        say_verde("ma razbun si iti voi da averea mea!")
                        local s=select("Te ajut!","Nu am timp")
                        if 2==s then
                                say_title("Ariyoung:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Ariyoung:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Ariyoung:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ariyoung:")
                        say_verde("")
                        say_verde("Multumesc, du-te si ucidel pe Goe-Pae!")
                        set_state(hunt)
                end
        end

        state hunt begin
                when letter begin
                        send_letter("~Lv 27 - Omoara niste Goe-Pae")
                        q.set_icon("scroll_open_golden.tga")
                end
                when info or  button begin
                        say_title("Omoara niste Goe-Pae")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Omoara Goe-Pae pana obtii o dovada ca")
                        say_verde("sa i-o duci la Ariyoung.")
                end
                when 20021.chat."Razbunarea lui Ariyoung" begin
                        say_title("Ariyoung:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Deci, l-ai razbunat pe stoul meu? Ai")
                        say_verde("gasit o dovada? Nu am sa iti dau toata")
                        say_verde("averea mea daca nu imi areti o dovada.")
                        local s=select("Ma duc sa mai incerc!","Nu am timp")
                        if 2==s then
                                say_title("Ariyoung:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Ariyoung:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Ariyoung:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ariyoung:")
                        say_verde("")
                        say_verde("Multumesc, du-te si ucidel pe Goe-Pae!")
                end

                when 493.kill begin
                        local s = number(1, 100)
                        if s <= 20 and pc.count_item(30101)==0 then
                                pc.give_item2(30101)
                                set_state(discover_ring)
                        end
                end

        end
        state discover_ring begin
                when letter begin
                        send_letter("~Lv 27 - Ai gasit o dovada")
                        q.set_icon("scroll_open_golden.tga")

                        local v=find_npc_by_vnum(20021)
                        if 0!=v then
                                target.vid("__TARGET__",v,"Du-te la Ariyoung")

                        end
                end
                when info or button begin
                        say_title("Ai gasit o dovada")
                        say_verde("")
                        say_verde("Ai gasit verigheta lui Ariyoung. Du-te")
                        say_verde("cu ea la Ariyoung si linisteste-o.")
                        say_item_vnum(30101)
                end

                when __TARGET__.target.click or
                        20021.chat."Am gasit o dovada" with pc.count_item("30101")>= 1  begin
                        target.delete("__TARGET__")
                        say_title("Ariyoung:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Acea... verigheta... a fost a sotului meu.")
                        say_verde("Acum se poate linisti in pace, multumesc!")
                        pc.remove_item(30101)
                        set_state(reward)
                        
                end
        end
        state reward begin
                when letter begin
                        send_letter("~Lv 27 - Averea lui Ariyoung")
                        q.set_icon("scroll_open_golden.tga")
                end
                when info or button begin
                        say_title("Averea lui Ariyoung")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("1.000.000 Yang")
                        pc.change_money(1000000)
                        clear_letter()
                        set_quest_state("levelup","run")
                        set_state(__COMPLETE__)
                end
        end

        state __GIVEUP__ begin
        end

        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end