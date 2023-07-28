class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show]

  def index
    @currencies = Currency.all
  end

  def show
    # TODO: 以下のレート更新処理をmodels/currency.rbに移す
    @currency.rates.first.destroy
    lo, hi = @currency.rate_min, @currency.rate_max
    rate = @currency.rates.last.rate
    new_rate = rate + (hi - lo) / 2 * (rand - 0.5)
    new_rate = new_rate.clamp(lo..hi)
    changed_at = @currency.rates.last.changed_at + 1.days
    @currency.rates.create(rate: new_rate, changed_at: changed_at)
  end

  private

  def set_currency
    @currency = Currency.find(params[:id])
  end
end
