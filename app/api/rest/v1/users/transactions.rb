class Rest::V1::Users::Transactions < Grape::API

  namespace :users do
    helpers do
      def find_walletable!
        @walletable = User.find_by(id: params[:user_id])
        error!("User not found", 400) if @walletable.blank?
        @wallet     = @walletable.wallet
      end
    end

    before do
      find_walletable!
    end


    route_param :user_id, type: Integer, desc: 'User ID' do
      # POST - /users/:user_id/transfer
      # POST - /users/:user_id/topup
      # POST - /users/:user_id/withdraw
      #
      resources :transactions do
        get do
          present Transaction.where("from_wallet_id = :wallet_id OR to_wallet_id = :wallet_id", wallet_id: @wallet.id), with: Entities::TransactionEntity
        end

        params do
          requires :transaction, type: Hash do
            requires :to_wallet_id,   allow_blank: false, type: Integer
            requires :amount,         allow_blank: false, type: Float, values: 0.0..
          end
        end
        post 'transfer' do
          @to_wallet = Wallet.find_by(id: params[:transaction][:to_wallet_id])
          error!("Target wallet is not exists") if @to_wallet.blank?

          @transaction = TransferTransaction.new(from_wallet: @wallet, to_wallet: @to_wallet, amount: params[:transaction][:amount])

          if @transaction.save
            present @transaction, with: Entities::TransactionEntity
          else
            error!({error: 'Validation Error', messages: @transaction.errors.full_messages, with: Entities::RecordError}, 422)
          end
        end

        params do
          requires :transaction, type: Hash do
            requires :amount,         allow_blank: false, type: Float, values: 0.0..
          end
        end
        post 'topup' do
          @transaction = TopupTransaction.new(to_wallet: @wallet, amount: params[:transaction][:amount])

          if @transaction.save
            present @transaction, with: Entities::TransactionEntity
          else
            error!({error: 'Validation Error', messages: @transaction.errors.full_messages, with: Entities::RecordError}, 422)
          end
        end

        params do
          requires :transaction, type: Hash do
            requires :amount,         allow_blank: false, type: Float, values: 0.0..
          end
        end
        post 'withdraw' do
          @transaction = WithdrawTransaction.new(from_wallet: @wallet, amount: params[:transaction][:amount])

          if @transaction.save
            present @transaction, with: Entities::TransactionEntity
          else
            error!({error: 'Validation Error', messages: @transaction.errors.full_messages, with: Entities::RecordError}, 422)
          end
        end
      end
    end
  end
end
