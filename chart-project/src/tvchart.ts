import * as TradingView from "./charting-library/charting_library";

declare global {
  interface Window {
    flutter_inappwebview: {
      callHandler: (handlerName: string, ...args: any) => Promise<any>;
    };
    toggleDarkTheme: () => void;
    toggleLightTheme: () => void;
  }
}

const datafeed: TradingView.IBasicDataFeed = {
  onReady: (callback: TradingView.OnReadyCallback) => {
    window.flutter_inappwebview.callHandler("onReady").then((result) => {
      callback(result);
    });
  },
  searchSymbols: (
    userInput: string,
    exchange: string,
    symbolType: string,
    onResult: TradingView.SearchSymbolsCallback
  ) => {
    window.flutter_inappwebview
      .callHandler("searchSymbols", userInput, exchange, symbolType)
      .then((value) => {
        if (Array.isArray(value)) {
          onResult(value);
        } else {
          onResult([]);
        }
      })
      .catch((reason) => {
        onResult([]);
      });
  },
  resolveSymbol: (
    symbolName: string,
    onResolve: TradingView.ResolveCallback,
    onError: TradingView.ErrorCallback
  ) => {
    window.flutter_inappwebview
      .callHandler("resolveSymbol", symbolName)
      .then((value) => {
        if (value !== null && typeof value === "object") {
          onResolve(value);
        } else if (typeof value === "string") {
          onError(value);
        } else {
          onError("Unexpected resolveSymbol return type");
        }
      })
      .catch((reason) => {
        onError("Unexpected error on resolveSymbol");
      });
  },
  getBars: (
    symbolInfo: TradingView.LibrarySymbolInfo,
    resolution: TradingView.ResolutionString,
    rangeStartDate: number,
    rangeEndDate: number,
    onResult: TradingView.HistoryCallback,
    onError: TradingView.ErrorCallback,
    isFirstCall: boolean
  ) => {
    window.flutter_inappwebview
      .callHandler(
        "getBars",
        symbolInfo,
        resolution,
        rangeStartDate,
        rangeEndDate,
        isFirstCall
      )
      .then((value) => {
        if (value !== null && typeof value === "object") {
          onResult(value.bars, value.meta);
        } else if (typeof value === "string") {
          onError(value);
        } else {
          onError("Unexpected getBars return type");
        }
      })
      .catch((reason) => {
        onError("Unexpected error on getBars");
      });
  },
  subscribeBars: (
    symbolInfo: TradingView.LibrarySymbolInfo,
    resolution: TradingView.ResolutionString,
    onTick: TradingView.SubscribeBarsCallback,
    listenerGuid: string,
    onResetCacheNeededCallback: () => void
  ) => {
    window.flutter_inappwebview
      .callHandler("subscribeBars", symbolInfo, resolution, listenerGuid)
      .then((value) => {
        if (value !== null && typeof value === "object") {
          onTick(value);
        }
      })
      .catch((reason) => {});
  },
  unsubscribeBars: (listenerGuid: string) => {
    window.flutter_inappwebview.callHandler("unsubscribeBars", listenerGuid);
  }
};

let chart: TradingView.IChartingLibraryWidget | undefined;

function toggleLightTheme() {
  if (chart != undefined) {
    chart.changeTheme("Light");
  }
}
window.toggleLightTheme = toggleLightTheme;

function toggleDarkTheme() {
  if (chart != undefined) {
    chart.changeTheme("Dark");
  }
}
window.toggleDarkTheme = toggleDarkTheme;

window.addEventListener("flutterInAppWebViewPlatformReady", (event) => {
  window.flutter_inappwebview
    .callHandler("start")
    .then((options: TradingView.ChartingLibraryWidgetOptions) => {
      options.container_id = "tvchart";
      options.library_path = "public/";
      options.datafeed = datafeed;

      if (chart == undefined) {
        chart = new TradingView.widget(options);
        chart.onChartReady(() => {
          chart.subscribe("onAutoSaveNeeded", () => {
            chart.save((state) => {
              window.flutter_inappwebview.callHandler("saveData", state);
            });
          });
        });
      }
    });
});
