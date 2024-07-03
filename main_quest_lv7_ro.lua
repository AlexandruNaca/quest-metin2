---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv7 begin
   state start begin
   end
   state run begin
      when login or levelup  or enter with pc.get_level() >= 7 begin
         setstate( gototeacher )      
      end
   end
   state gototeacher begin
      when letter begin
         local v=find_npc_by_vnum(20354)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Gardianul Orasului")
         end
      end
      when letter begin
         send_letter("+Lv 7 - Dute la Gardianul Orasului")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Dute la Gardianul Orasului")
         say_verde("")
         say_verde("Gardianul are nevoie de tine din nou.")
         say_verde("Dute la el si vorbeste cu instructorul.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")

         say_title("Gardian:")
         say_verde("")
         say_verde("Deja ai acumulat multa experienta si esti")
         say_verde("mult mai pregatit pentru aceste meleaguri.")
         wait()
         say_title("Gardian:")
         say_verde("")
         say_verde("De data aceasta dute la Fierarul din sat.")
         say_verde("El are o sarcina pentru tine si o sa iti")
         say_verde("explice cum poti imbunatati echipamentul.")
         set_state( gotosmith )
      end
   end


   state gotosmith begin
      when letter begin
         local v=find_npc_by_vnum(20016)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Dute la Fierar")
         end
      end
      when letter begin
         send_letter("+Lv 7 - Dute la Fierar")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Dute la Fierar")
         say_verde("")
         say_verde("Fierarul are nevoie de ajutorul tau.")
         say_verde("El este in mijlocul satului, dute la el.")
      end

      when __TARGET__.target.click begin
         target.delete("__TARGET__")

         say_title("Fierar:")
         say_verde("")
         say_verde("Am nevoie de tine ca sa ma revansez fata")
         say_verde("de un prieten al meu. Este vorba de")
         say_verde("Administratorul depozitului.")
         wait()
         say_title("Fierar:")
         say_verde("")
         say_verde("Ii sunt dator cu un Rat de porc insa abia")
         say_verde("acum ce ia esuat unui razboinic echipamentul")
         say_verde("si am pastrat eu Ratul de porc... Acum pot")
         say_verde("sa imi platesc datoria... ")
         set_state( gotowarehousekeeper )

      end
   end
   state gotowarehousekeeper begin
      when letter begin
         local v=find_npc_by_vnum(9005)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Dute la Administrator")
         end
      end
      when letter begin
         send_letter("+Lv 7 - Dute la Administrator")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Dute la Administrator")
         say_verde("")
         say_verde("Dute la Administatorul depozitului cu Ratul")
         say_verde("de porc pe care ti la dat Fierarul din sat.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")

         say_title("Administratorul Depozitului:")
         say_verde("")
         say_verde("Bine ai venit razboinicule, cu ce ocazie")
         say_verde("imi faci aceasta vizita modesta ?")
         wait()
         say_title("Administratorul Depozitului:")
         say_verde("")
         say_verde("Inteleg, deci Fierarul si-a platit datoria")
         say_verde("in sfarsit. Tot asa face, profita de pe ")
         say_verde("razboinicii noi veniti in sat... Eh, bine.")
         say_verde("")
         say_verde("Multumesc pentru livrare, dute la Fierar")
         say_verde("si spune-i ca acum suntem chit.")
         set_state( gotosmith2 )
      end
   end
   state gotosmith2 begin
      when letter begin
         local v=find_npc_by_vnum(20016)
         if 0==v then
         else
            target.vid("__TARGET__", v, "Inapoi la Fierar")
         end
      end
      when letter begin
         send_letter("+Lv 7 - Inapoi la Fierar")
         q.set_icon("scroll_open_purple.tga")
      end
      when button or info begin
         say_title("Inapoi la Fierar")
         say_verde("")
         say_verde("Administratorul depozitului a spus sa te")
         say_verde("intorci la Fierar si sa raportezi.")
      end
      when __TARGET__.target.click begin
         target.delete("__TARGET__")

         say_title("Fierar:" )
         say_verde("")
         say_verde("Multumesc ca m-ai rezolvat razboinicule.")
         say_verde("Mi-ai luat o piatra de pe suflet.")
         wait()
         say_title("Fierar:" )
         say_verde("")
         say_verde("Eu ma ocup cu imbunatatirea echipamentului")
         say_verde("tau, il pot imbunatati pana la +9 insa unele")
         say_verde("obiecte necesita o procedura cu anumite")
         say_verde("materiale care sunt greu de obtinut...")
         wait()
         say_title("Fierar:")
         say_verde("")
         say_verde("De asemnea eu fabric si pergamente cu care")
         say_verde("poti sa iti imbunatatesti singur echipamentul")
         say_verde("si in cazul in care esueaza echipamentul nu")
         say_verde("o sa se distruga, ci va fi scazut un plus.")
         wait()
         say_title("Fierar")
         say_verde("")
         say_reward("Recompensa:")
         say_reward("8.000 Puncte de experienta")
         say_reward("30.000 Yang")
         pc.give_exp2(8000)
         pc.change_money(30000)
         
         set_quest_state("levelup","run")

         clear_letter()
         set_state( __COMPLETE__ )
         set_quest_state("main_quest_lv9", "run")

      end
   end
   state __COMPLETE__ begin
   end

end