// AX Proof 배포 설정
// 공유 DB(Supabase)를 쓰려면 아래 두 값을 채우고 저장소에 다시 올리세요.
// 비워두면 각 브라우저에만 저장되는 로컬 모드로 동작합니다.
//
// - supabaseUrl: Supabase → Project Settings → API → Project URL
// - supabaseAnonKey: 같은 화면의 anon public key
//
// anon key는 공개용 키라 저장소에 올라가도 되지만, 이 시범 운영 구조에서는
// 주소를 아는 사람 누구나 데이터를 읽고 쓸 수 있습니다. 실명·연락처·회사 기밀은 넣지 마세요.
// Claude API 키는 절대 여기에 넣지 마세요. (각자 웹사이트 안에서 입력, 그 브라우저에만 저장)
window.AXPROOF_CONFIG = {
  supabaseUrl: "",
  supabaseAnonKey: ""
};
