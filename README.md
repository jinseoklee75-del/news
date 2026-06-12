# 디지털 자산 뉴스 허브

디지털 자산, STO, RWA, AI 관련 최신 뉴스를 수집·열람하고 이메일로 받아볼 수 있는 웹 애플리케이션입니다.

## 기능

- **뉴스 수집**: CoinDesk, CoinTelegraph, TechCrunch 등 RSS 피드에서 기사 자동 수집
- **카테고리 필터**: 디지털 자산 / STO / RWA / AI
- **웹 대시보드**: 최신 기사 카드 형태로 열람
- **이메일 구독**: 관심 카테고리 선택 후 매일(또는 매주) 다이제스트 수신
- **자동 스케줄**: 설정된 주기로 뉴스 수집 및 이메일 발송

## 설치 및 실행

### 1. 실행 (가장 쉬운 방법)

`start.bat` 파일을 더블클릭하세요.

또는 터미널에서:

```bash
cd 프로젝트3
py -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
python run.py
```

> Python 3.15 베타도 지원합니다. `py` 명령이 안 되면 `python`을 사용하세요.

### 2. 환경 변수 설정 (이메일 발송 시)

`.env.example`을 복사해 `.env` 파일을 만듭니다.

```bash
copy .env.example .env
```

`.env`에서 SMTP 정보를 입력합니다. Gmail 사용 시 [앱 비밀번호](https://myaccount.google.com/apppasswords)가 필요합니다.

```env
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASSWORD=your-app-password
SMTP_FROM=your-email@gmail.com
EMAIL_FREQUENCY=daily
```

> SMTP를 설정하지 않으면 웹사이트와 뉴스 수집은 정상 동작하지만, 이메일은 발송되지 않습니다.

### 3. 서버 실행

```bash
python run.py
```

브라우저에서 **http://localhost:8000** 을 엽니다.

## API

| 메서드 | 경로 | 설명 |
|--------|------|------|
| GET | `/api/articles` | 기사 목록 (`?category=digital_asset`) |
| GET | `/api/categories` | 카테고리 목록 |
| POST | `/api/subscribe` | 이메일 구독 |
| POST | `/api/unsubscribe` | 구독 해지 |
| POST | `/api/fetch` | 수동 뉴스 수집 |

## 프로젝트 구조

```
프로젝트3/
├── app/
│   ├── main.py          # Flask 앱
│   ├── news_fetcher.py  # RSS 뉴스 수집
│   ├── email_service.py # 이메일 발송
│   ├── scheduler.py     # 자동 스케줄
│   ├── models.py        # DB 모델
│   ├── static/          # CSS, JS
│   └── templates/       # HTML
├── requirements.txt
├── run.py
└── .env.example
```
