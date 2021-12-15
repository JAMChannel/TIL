## web-vitals

#### web-vitals
パフォーマンスとユーザーエクスペリエンスを測定するための手法
```
yarn add web-vitals
```

- jsx追加
```
import reportWebVitals from './reportWebVitals';

reportWebVitals(console.log);
```

- reportWebVitals.js追加

```
const reportWebVitals = onPerfEntry => {
  if (onPerfEntry && onPerfEntry instanceof Function) {
    import('web-vitals').then(({ getCLS, getFID, getFCP, getLCP, getTTFB }) => {
      getCLS(onPerfEntry);
      getFID(onPerfEntry);
      getFCP(onPerfEntry);
      getLCP(onPerfEntry);
      getTTFB(onPerfEntry);
    });
  }
};

export default reportWebVitals;
```