/**
 * @file
 * Strategy based on the Fibonacci retracement levels.
 */

enum ENUM_STG_RETRACEMENT_TYPE {
  STG_RETRACEMENT_TYPE_0_NONE = 0,     // (None)
  STG_RETRACEMENT_TYPE_AMA,            // AMA: Adaptive Moving Average
  STG_RETRACEMENT_TYPE_DEMA,           // DEMA: Double Exponential Moving Average
  STG_RETRACEMENT_TYPE_FRAMA,          // FrAMA: Fractal Adaptive Moving Average
  STG_RETRACEMENT_TYPE_ICHIMOKU,       // Ichimoku
  STG_RETRACEMENT_TYPE_MA,             // MA: Moving Average
  STG_RETRACEMENT_TYPE_PRICE_CHANNEL,  // Price Channel
  STG_RETRACEMENT_TYPE_SAR,            // SAR: Parabolic Stop and Reverse
  STG_RETRACEMENT_TYPE_TEMA,           // TEMA: Triple Exponential Moving Average
  STG_RETRACEMENT_TYPE_VIDYA,          // VIDYA: Variable Index Dynamic Average
};

// User params.
INPUT_GROUP("Retracement strategy: main strategy params");
INPUT ENUM_STG_RETRACEMENT_TYPE Retracement_Type = STG_RETRACEMENT_TYPE_TEMA;  // Retracement: Indicator MA type
INPUT ENUM_PP_TYPE Retracement_Calc_Mode = PP_FLOOR;                           // Calculation mode
INPUT_GROUP("Retracement strategy: strategy params");
INPUT float Retracement_LotSize = 0;                // Lot size
INPUT int Retracement_SignalOpenMethod = 1;         // Signal open method (-3-3)
INPUT float Retracement_SignalOpenLevel = 0.5f;     // Signal open level
INPUT int Retracement_SignalOpenFilterMethod = 32;  // Signal open filter method
INPUT int Retracement_SignalOpenFilterTime = 3;     // Signal open filter time
INPUT int Retracement_SignalOpenBoostMethod = 0;    // Signal open boost method
INPUT int Retracement_SignalCloseMethod = 1;        // Signal close method (-3-3)
INPUT int Retracement_SignalCloseFilter = 0;        // Signal close filter (-127-127)
INPUT float Retracement_SignalCloseLevel = 0.5f;    // Signal close level
INPUT int Retracement_PriceStopMethod = 1;          // Price stop method (0-127)
INPUT float Retracement_PriceStopLevel = 2;         // Price stop level
INPUT int Retracement_TickFilterMethod = 32;        // Tick filter method
INPUT float Retracement_MaxSpread = 4.0;            // Max spread to trade (pips)
INPUT short Retracement_Shift = 0;                  // Shift
INPUT float Retracement_OrderCloseLoss = 80;        // Order close loss
INPUT float Retracement_OrderCloseProfit = 80;      // Order close profit
INPUT int Retracement_OrderCloseTime = -30;         // Order close time in mins (>0) or bars (<0)
INPUT_GROUP("Retracement strategy: AMA indicator params");
INPUT int Retracement_Indi_AMA_InpPeriodAMA = 20;                              // AMA period
INPUT int Retracement_Indi_AMA_InpFastPeriodEMA = 4;                           // Fast EMA period
INPUT int Retracement_Indi_AMA_InpSlowPeriodEMA = 30;                          // Slow EMA period
INPUT int Retracement_Indi_AMA_InpShiftAMA = 4;                                // AMA shift
INPUT int Retracement_Indi_AMA_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Retracement_Indi_AMA_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Retracement strategy: DEMA indicator params");
INPUT int Retracement_Indi_DEMA_Period = 25;                                    // Period
INPUT int Retracement_Indi_DEMA_MA_Shift = 6;                                   // MA Shift
INPUT ENUM_APPLIED_PRICE Retracement_Indi_DEMA_Applied_Price = PRICE_TYPICAL;   // Applied Price
INPUT int Retracement_Indi_DEMA_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Retracement_Indi_DEMA_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Retracement strategy: FrAMA indicator params");
INPUT int Retracement_Indi_FrAMA_Period = 10;                                    // Period
INPUT ENUM_APPLIED_PRICE Retracement_Indi_FrAMA_Applied_Price = PRICE_MEDIAN;    // Applied Price
INPUT int Retracement_Indi_FrAMA_MA_Shift = 0;                                   // MA Shift
INPUT int Retracement_Indi_FrAMA_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Retracement_Indi_FrAMA_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Retracement strategy: Ichimoku indicator params");
// INPUT ENUM_ICHIMOKU_LINE Retracement_Indi_Ichimoku_MA_Line = LINE_TENKANSEN; // Ichimoku line for MA
INPUT int Retracement_Indi_Ichimoku_Period_Tenkan_Sen = 30;                         // Period Tenkan Sen
INPUT int Retracement_Indi_Ichimoku_Period_Kijun_Sen = 10;                          // Period Kijun Sen
INPUT int Retracement_Indi_Ichimoku_Period_Senkou_Span_B = 30;                      // Period Senkou Span B
INPUT int Retracement_Indi_Ichimoku_Shift = 1;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Retracement_Indi_Ichimoku_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Retracement strategy: MA indicator params");
INPUT int Retracement_Indi_MA_Period = 26;                                    // Period
INPUT int Retracement_Indi_MA_MA_Shift = 0;                                   // MA Shift
INPUT ENUM_MA_METHOD Retracement_Indi_MA_Method = MODE_LWMA;                  // MA Method
INPUT ENUM_APPLIED_PRICE Retracement_Indi_MA_Applied_Price = PRICE_WEIGHTED;  // Applied Price
INPUT int Retracement_Indi_MA_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Retracement_Indi_MA_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Retracement strategy: Price Channel indicator params");
INPUT int Retracement_Indi_PriceChannel_Period = 26;                                    // Period
INPUT int Retracement_Indi_PriceChannel_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Retracement_Indi_PriceChannel_SourceType = IDATA_ICUSTOM;  // Source type
INPUT_GROUP("Retracement strategy: SAR indicator params");
INPUT float Retracement_Indi_SAR_Step = 0.04f;                                 // Step
INPUT float Retracement_Indi_SAR_Maximum_Stop = 0.4f;                          // Maximum stop
INPUT int Retracement_Indi_SAR_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Retracement_Indi_SAR_SourceType = IDATA_ICUSTOM;  // Source type
INPUT_GROUP("Retracement strategy: TEMA indicator params");
INPUT int Retracement_Indi_TEMA_Period = 10;                                    // Period
INPUT int Retracement_Indi_TEMA_MA_Shift = 0;                                   // MA Shift
INPUT ENUM_APPLIED_PRICE Retracement_Indi_TEMA_Applied_Price = PRICE_WEIGHTED;  // Applied Price
INPUT int Retracement_Indi_TEMA_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Retracement_Indi_TEMA_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Retracement strategy: VIDYA indicator params");
INPUT int Retracement_Indi_VIDYA_Period = 30;                                    // Period
INPUT int Retracement_Indi_VIDYA_MA_Period = 20;                                 // MA Period
INPUT int Retracement_Indi_VIDYA_MA_Shift = 1;                                   // MA Shift
INPUT ENUM_APPLIED_PRICE Retracement_Indi_VIDYA_Applied_Price = PRICE_WEIGHTED;  // Applied Price
INPUT int Retracement_Indi_VIDYA_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Retracement_Indi_VIDYA_SourceType = IDATA_BUILTIN;  // Source type

// Structs.

// Defines struct with default user strategy values.
struct Stg_Retracement_Params_Defaults : StgParams {
  Stg_Retracement_Params_Defaults()
      : StgParams(::Retracement_SignalOpenMethod, ::Retracement_SignalOpenFilterMethod, ::Retracement_SignalOpenLevel,
                  ::Retracement_SignalOpenBoostMethod, ::Retracement_SignalCloseMethod, ::Retracement_SignalCloseFilter,
                  ::Retracement_SignalCloseLevel, ::Retracement_PriceStopMethod, ::Retracement_PriceStopLevel,
                  ::Retracement_TickFilterMethod, ::Retracement_MaxSpread, ::Retracement_Shift) {
    Set(STRAT_PARAM_LS, Retracement_LotSize);
    Set(STRAT_PARAM_OCL, Retracement_OrderCloseLoss);
    Set(STRAT_PARAM_OCP, Retracement_OrderCloseProfit);
    Set(STRAT_PARAM_OCT, Retracement_OrderCloseTime);
    Set(STRAT_PARAM_SOFT, Retracement_SignalOpenFilterTime);
  }
};

class Stg_Retracement : public Strategy {
 protected:
  Stg_Retracement_Params_Defaults ssparams;

 public:
  Stg_Retracement(StgParams &_sparams, TradeParams &_tparams, ChartParams &_cparams, string _name = "")
      : Strategy(_sparams, _tparams, _cparams, _name) {}

  static Stg_Retracement *Init(ENUM_TIMEFRAMES _tf = NULL, EA *_ea = NULL) {
    // Initialize strategy initial values.
    Stg_Retracement_Params_Defaults stg_ma_defaults;
    StgParams _stg_params(stg_ma_defaults);
    // Initialize Strategy instance.
    ChartParams _cparams(_tf, _Symbol);
    TradeParams _tparams;
    Strategy *_strat = new Stg_Retracement(_stg_params, _tparams, _cparams, "MA");
    return _strat;
  }

  /**
   * Event on strategy's init.
   */
  void OnInit() {
    // Initialize indicators.
    switch (Retracement_Type) {
      case STG_RETRACEMENT_TYPE_AMA:  // AMA
      {
        IndiAMAParams _indi_params(::Retracement_Indi_AMA_InpPeriodAMA, ::Retracement_Indi_AMA_InpFastPeriodEMA,
                                   ::Retracement_Indi_AMA_InpSlowPeriodEMA, ::Retracement_Indi_AMA_InpShiftAMA,
                                   PRICE_TYPICAL, ::Retracement_Indi_AMA_Shift);
        _indi_params.SetDataSourceType(::Retracement_Indi_AMA_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_AMA(_indi_params), ::Retracement_Type);
        break;
      }
      case STG_RETRACEMENT_TYPE_DEMA:  // DEMA
      {
        IndiDEIndiMAParams _indi_params(::Retracement_Indi_DEMA_Period, ::Retracement_Indi_DEMA_MA_Shift,
                                        ::Retracement_Indi_DEMA_Applied_Price, ::Retracement_Indi_DEMA_Shift);
        _indi_params.SetDataSourceType(::Retracement_Indi_DEMA_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_DEMA(_indi_params), ::Retracement_Type);
        break;
      }
      case STG_RETRACEMENT_TYPE_FRAMA:  // FrAMA
      {
        IndiFrAIndiMAParams _indi_params(::Retracement_Indi_FrAMA_Period, ::Retracement_Indi_FrAMA_MA_Shift,
                                         ::Retracement_Indi_FrAMA_Applied_Price, ::Retracement_Indi_FrAMA_Shift);
        _indi_params.SetDataSourceType(::Retracement_Indi_FrAMA_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_FrAMA(_indi_params), ::Retracement_Type);
        break;
      }
      case STG_RETRACEMENT_TYPE_ICHIMOKU:  // Ichimoku
      {
        IndiIchimokuParams _indi_params(
            ::Retracement_Indi_Ichimoku_Period_Tenkan_Sen, ::Retracement_Indi_Ichimoku_Period_Kijun_Sen,
            ::Retracement_Indi_Ichimoku_Period_Senkou_Span_B, ::Retracement_Indi_Ichimoku_Shift);
        _indi_params.SetDataSourceType(::Retracement_Indi_Ichimoku_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_Ichimoku(_indi_params), ::Retracement_Type);
        break;
      }
      case STG_RETRACEMENT_TYPE_MA:  // MA
      {
        IndiMAParams _indi_params(::Retracement_Indi_MA_Period, ::Retracement_Indi_MA_MA_Shift,
                                  ::Retracement_Indi_MA_Method, ::Retracement_Indi_MA_Applied_Price,
                                  ::Retracement_Indi_MA_Shift);
        _indi_params.SetDataSourceType(::Retracement_Indi_MA_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_MA(_indi_params), ::Retracement_Type);
        break;
      }
      case STG_RETRACEMENT_TYPE_PRICE_CHANNEL:  // Price Channel
      {
        IndiPriceChannelParams _indi_params(::Retracement_Indi_PriceChannel_Period,
                                            ::Retracement_Indi_PriceChannel_Shift);
        _indi_params.SetDataSourceType(::Retracement_Indi_PriceChannel_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_PriceChannel(_indi_params), ::Retracement_Type);
        break;
      }
      case STG_RETRACEMENT_TYPE_SAR:  // SAR
      {
        IndiSARParams _indi_params(::Retracement_Indi_SAR_Step, ::Retracement_Indi_SAR_Maximum_Stop,
                                   ::Retracement_Indi_SAR_Shift);
        _indi_params.SetDataSourceType(::Retracement_Indi_SAR_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_SAR(_indi_params), ::Retracement_Type);
        break;
      }
      case STG_RETRACEMENT_TYPE_TEMA:  // TEMA
      {
        IndiTEMAParams _indi_params(::Retracement_Indi_TEMA_Period, ::Retracement_Indi_TEMA_MA_Shift,
                                    ::Retracement_Indi_TEMA_Applied_Price, ::Retracement_Indi_TEMA_Shift);
        _indi_params.SetDataSourceType(::Retracement_Indi_TEMA_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_TEMA(_indi_params), ::Retracement_Type);
        break;
      }
      case STG_RETRACEMENT_TYPE_VIDYA:  // VIDYA
      {
        IndiVIDYAParams _indi_params(::Retracement_Indi_VIDYA_Period, ::Retracement_Indi_VIDYA_MA_Period,
                                     ::Retracement_Indi_VIDYA_MA_Shift, ::Retracement_Indi_VIDYA_Applied_Price,
                                     ::Retracement_Indi_VIDYA_Shift);
        _indi_params.SetDataSourceType(::Retracement_Indi_VIDYA_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_VIDYA(_indi_params), ::Retracement_Type);
        break;
      }
      case STG_RETRACEMENT_TYPE_0_NONE:  // (None)
      default:
        break;
    }
  }

  /**
   * Check strategy's opening signal.
   */
  bool SignalOpen(ENUM_ORDER_TYPE _cmd, int _method = 0, float _level = 0.0f, int _shift = 0) {
    Chart *_chart = trade.GetChart();
    IndicatorBase *_indi = GetIndicator(::Retracement_Type);
    // uint _ishift = _indi.GetParams().GetShift(); // @todo: Convert into Get().
    // bool _result = _indi.GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift); // @fixme
    uint _ishift = _shift;
    bool _result = true;
    if (!_result) {
      // Returns false when indicator data is not valid.
      return false;
    }
    // float _level_pips = (float)(_level * _chart.GetPipSize());
    float _level_pips = (float)(_level * _chart.GetPipSize());
    float _pp, _r1, _r2, _r3, _r4, _s1, _s2, _s3, _s4;
    ChartEntry _ohlc_d1 = _chart.GetEntry(PERIOD_D1, _shift + 1, _chart.GetSymbol());
    double _d1_pivot =
        _ohlc_d1.bar.ohlc.GetPivots(::Retracement_Calc_Mode, _pp, _r1, _r2, _r3, _r4, _s1, _s2, _s3, _s4);
    bool _ma_cross_r1_up = _indi[_ishift][0] > _r1 + _level_pips && _indi[_ishift + 1][0] < _r1;
    bool _ma_cross_r2_up = _indi[_ishift][0] > _r2 + _level_pips && _indi[_ishift + 1][0] < _r2;
    bool _ma_cross_r3_up = _indi[_ishift][0] > _r3 + _level_pips && _indi[_ishift + 1][0] < _r3;
    bool _ma_cross_r4_up = _indi[_ishift][0] > _r4 + _level_pips && _indi[_ishift + 1][0] < _r4;
    bool _ma_cross_s1_down = _indi[_ishift][0] < _s1 - _level_pips && _indi[_ishift + 1][0] > _s1;
    bool _ma_cross_s2_down = _indi[_ishift][0] < _s2 - _level_pips && _indi[_ishift + 1][0] > _s2;
    bool _ma_cross_s3_down = _indi[_ishift][0] < _s3 - _level_pips && _indi[_ishift + 1][0] > _s3;
    bool _ma_cross_s4_down = _indi[_ishift][0] < _s4 - _level_pips && _indi[_ishift + 1][0] > _s4;
    switch (_cmd) {
      case ORDER_TYPE_BUY:
        // Buy signal.
        _result &= _indi.IsIncreasing(1, 0, _ishift);
        _result &= (_ma_cross_r1_up || _ma_cross_r2_up || _ma_cross_r3_up || _ma_cross_r4_up);
        if (_result && _method != 0) {
          if (METHOD(_method, 0))
            _result &= fmax4(_indi[_ishift][0], _indi[_ishift + 1][0], _indi[_ishift + 2][0], _indi[_ishift + 3][0]) ==
                       _indi[_ishift][0];
        }
        break;
      case ORDER_TYPE_SELL:
        // Sell signal.
        _result &= _indi.IsDecreasing(1, 0, _ishift);
        _result &= (_ma_cross_s1_down || _ma_cross_s2_down || _ma_cross_s3_down || _ma_cross_s4_down);
        if (_result && _method != 0) {
          if (METHOD(_method, 0))
            _result &= fmin4(_indi[_ishift][0], _indi[_ishift + 1][0], _indi[_ishift + 2][0], _indi[_ishift + 3][0]) ==
                       _indi[_ishift][0];
        }
        break;
    }
    return _result;
  }
};
