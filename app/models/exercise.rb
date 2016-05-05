class Exercise < ActiveRecord::Base
    
  enum status: [:passives, :subjunctives, :tenses, :conditionals, :reported, :modals, :gerunds]  
    
  def   self.how_many_sentences(type)
   if type == :passives
        num_of_type_exerc = self.passives.count
   elsif type == :subjunctives
        num_of_type_exerc = self.subjunctives.count
   elsif type == :tenses
        num_of_type_exerc = self.tenses.count
   elsif type == :conditionals
        num_of_type_exerc = self.conditionals.count      
   else
      "sthg went wrong + #{type.inspect}"
   end  
  end
    
end
