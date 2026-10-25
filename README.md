# AX Proof · 링커스 시범 운영

AI와 함께한 프로젝트에서 내린 **판단의 순간**을 기록하고, 그 기록을 Decision Log 제출본(PDF)으로 내보내는 웹 서비스입니다. 링커스 20기 AI:Go(개인 프로젝트) 시범 운영용입니다.

- **멤버:** AI 작업 공간 · 판단 카드 기록 · 저장 직후 AI 사수 즉석 질문 · AI 사수 정리 도우미 · 결과/배운 점 · DL 제출본 PDF
- **멘토(운영진·OB):** 검토 대기 · 기여 확인 · 역량 평가
- **운영진:** 운영 대시보드 · 멤버/프로젝트 관리 · 데이터 백업 · 공유 DB 설정

설치나 빌드는 없습니다. `index.html` 파일 하나로 동작합니다.

## 파일 구성

| 파일 | 역할 |
|---|---|
| `index.html` | 웹사이트 본체 |
| `config.js` | (선택) 공유 DB 주소. 비워두면 브라우저별 로컬 저장 |
| `supabase.sql` | (선택) 공유 DB 테이블 생성 SQL |
| `.nojekyll` | GitHub Pages가 파일을 가공하지 않도록 하는 빈 파일 |
| `.gitignore` | 멤버 데이터 백업 파일이 올라가지 않도록 막음 |

## 1. GitHub Pages로 배포하기 (웹 화면만으로)

1. GitHub 로그인 → 오른쪽 위 **+ → New repository**
   - Repository name: 예) `axproof-pilot`
   - **Public** 선택 (무료 계정의 GitHub Pages는 공개 저장소에서만 동작)
   - **Create repository**
2. 새 저장소 화면에서 **uploading an existing file** 클릭
   - 이 폴더의 `index.html`, `config.js`, `supabase.sql`, `README.md`를 끌어다 놓기
   - `.nojekyll`, `.gitignore`는 숨김 파일이라 안 보이면 생략해도 됩니다
   - 아래 **Commit changes**
3. 저장소 **Settings → Pages**
   - Source: **Deploy from a branch**
   - Branch: **main** / **/(root)** → **Save**
4. 1~2분 뒤 같은 화면 위쪽에 주소가 뜹니다.
   `https://<내 GitHub 아이디>.github.io/axproof-pilot/`

수정할 때는 바뀐 파일을 같은 방법으로 다시 올리면 1~2분 안에 반영됩니다.

## 1-1. 명령어로 올리기 (Git을 쓰는 경우)

```bash
cd axproof-site
git init
git add .
git commit -m "AX Proof 시범 운영 첫 배포"
git branch -M main
git remote add origin https://github.com/<아이디>/axproof-pilot.git
git push -u origin main
```

그다음 위 3번(Settings → Pages)만 설정하면 됩니다.

## 2. (선택) 멤버들이 같은 데이터를 쓰게 하기 — Supabase 무료 플랜

배포만 하면 데이터는 **각자의 브라우저에만** 저장됩니다. 멤버·멘토·운영진이 같은 기록을 보려면 공유 DB를 연결하세요. 약 30분 걸립니다.

1. [supabase.com](https://supabase.com) 가입 → **New project** (리전은 Seoul 권장)
2. 왼쪽 **SQL Editor** → `supabase.sql` 내용 붙여넣기 → **Run**
3. **Project Settings → API**에서 `Project URL`과 `anon public` 키 복사
4. `config.js`의 두 값에 붙여넣고 저장소에 다시 올리기
5. 배포 주소를 열면 왼쪽 아래에 **"공유 DB 연결됨"**이 보입니다.

이렇게 연결하면 기록 시각이 **서버 시간**으로 찍히고, 판단 카드는 DB 차원에서 수정이 막힙니다.

## 3. (선택) AI 기능 켜기 — Claude API

- 웹사이트의 **판단 기록하기** 화면 또는 **데이터·공유 설정**에서 Claude API 키를 입력합니다.
- 키는 **그 브라우저에만** 저장되고 저장소나 공유 DB에는 올라가지 않습니다.
- 키가 없어도 AI 사수는 규칙 기반 기본 모드로 동작합니다.
- 사용 모델: `claude-opus-5-5` (effort `low`). 정책상 답을 거절하면 다른 모델이 이어받도록 서버 측 fallback이 켜져 있습니다.

## 4. 처음 열었을 때

- **예시 데이터 불러오기:** 가상의 링커스 2팀·3팀 데이터로 모든 화면을 둘러봅니다.
- **빈 상태로 시작하기:** 운영진 계정을 만들고 **멤버·프로젝트 관리**에서 사람과 프로젝트를 등록합니다.
- 공유 DB를 연결했다면 시범 운영 전에 예시 데이터가 아니라 **빈 상태로 시작**하세요.

## 보안 · 개인정보 주의

- **Claude API 키를 `config.js`나 다른 파일에 넣어 올리지 마세요.** 공개 저장소에 올라간 키는 바로 노출됩니다.
- 브라우저에서 Claude를 직접 부르는 구조라, 키를 넣은 기기를 쓰는 사람은 키를 볼 수 있습니다. 시범 운영 전용 키를 만들고 Claude Console에서 **월 사용 한도**를 거세요.
- 현재는 로그인 없이 "현재 사용자"를 고르는 시범 운영용 구조입니다. 공유 DB 주소를 아는 사람은 데이터를 읽고 쓸 수 있으므로 **실명·연락처·회사 기밀은 넣지 마세요.** 닉네임 사용을 권장합니다.
- 정식 운영 전에는 로그인, 사용자별 권한(Row Level Security), 서버를 거친 AI 호출이 필요합니다.
