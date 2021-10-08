# frozen_string_literal: true

namespace :dev do
      
    desc 'Configura o ambiente de desenvolvimento'
  
    task setup: :environment do
      if Rails.env.development?
        show_spinner('Cadastrando tipos de investimentos...') { `rails dev:add_investment_types` }
      else
        puts 'Você não está em ambiente de desenvolvimento!'
      end
    end
  
    desc 'Adiciona tipos de investimentos'
    task add_investment_types: :environment do
      InvestimentType.create!(name: 'Ações',  description: '')
      InvestimentType.create!(name: 'Fundos de investimento',  description: '')      
    end    
  
    private
  
    def show_spinner(msg_start, msg_end = 'Concluído!')
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end

  end