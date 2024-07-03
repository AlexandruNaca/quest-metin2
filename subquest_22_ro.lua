---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_22 begin
        state start begin
                when login or levelup with pc.level >= 35  and pc.level <= 37 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20015)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Securea lui Deokbae")
                        end
                end


                when __TARGET__.target.click or
                        20015.chat."Securea lui Deokbae" begin
                        target.delete("__TARGET__")
                        say_title("Deokbae:")
                        say_verde("")
                        say_verde("Am pierdut securea din nou, ma ajuti")
                        say_verde("te rog frumos sa o gasesc inapoi?")
                        local s=select("Ma ocup eu","Nu am timp")
                        if 2==s then
                                say_title("Deokbae:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Deokbae:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Deokbae:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Deokbae:")
                        say_verde("")
                        say_verde("Multumesc, du-te si omoara vantul negru!")

                set_state(hunt_for_goldaxe)
                end
        end




        state hunt_for_goldaxe begin
                when letter begin
                        send_letter("~Lv 35 - Securea lui Deokbae")
                        q.set_icon("scroll_open_golden.tga")

                        if pc.count_item(30102)>0 then
                                local v=find_npc_by_vnum(20015)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Securea lui Deokbae")
                                end
                        end

                end
                when info or  button begin
                        if pc.count_item(30102)>0 then
                                say_title("Securea lui Deokbae")
                                say_verde("")
                                say_verde("Ai gasit securea, du-te la Deokbae.")
                                return
                        end
                        say_title("Securea lui Deokbae")
                        say_verde("")
                        say_verde("Omoara vantul negru ca sa gasesti")
                        say_verde("securea de aur a lui Deokbae.")
                end



                when 504.kill  begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item(30102)==0  then
                                pc.give_item2(30102, 1)

                                local v=find_npc_by_vnum(20015)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Securea lui Deokbae")
                                end
                        end
                end



                when 20015.chat."Ti-am gasit securea" with pc.count_item("30102")>=1 begin
                        target.delete("__TARGET__")
                        say_title("Deokbae:")
                        say_verde("")
                        say_verde("Oh, multumesc frumos ca ai gasit-o.")
                        say_verde("")
                        say_reward("Recompensa:" )
                        say_reward("2.000.000 Puncte de experienta")
                        say_reward("150.000 Yang")
                        say_reward("x4 Cufar lumina lunii")
                        pc.give_exp2(2000000)
                        pc.change_money(150000)
                        pc.give_item2(50011, 4)
                        pc.remove_item(30102,1)
                        set_quest_state("levelup","run")
                        set_state(__THEEND__)
                        clear_letter()
                end
        end


        state __GIVEUP__ begin
        end
        state __THEEND__ begin
                when enter begin
                        q.done()
                end
        end
end