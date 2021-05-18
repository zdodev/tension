# 테스트 주도 개발

## TDD의 세 가지 원칙

1. 실패하는 단위 테스트를 작성할 때까지 실제 코드를 작성하지 않습니다.
2. 컴파일은 실패하지 않으면서 실행이 실패하는 정도로만 단위 테스트를 작성합니다.
3. 현재 실패하는 테스트를 통과할 정도로만 실제 코드를 작성합니다.

테스트 코드는 실제 코드 못지않게 중요합니다. 그러므로 테스트 코드도 실제 코드 못지않게 깨끗하게 작성해야 합니다. 테스트는 코드에 유연성과 유지보수성 그리고 재사용성을 제공합니다. 왜? 테스트 케이스가 있으면 변경이 두렵지 않으니까요. 변경이 두렵지 않으면 더 좋은 코드로 변경하는 것을 주저하지 않습니다.

🤔 테스트 당 assert 문은 하나로 제한하는 것이 좋을까요? 여러 assert를 사용하도록 하는 것이 좋을까요?

- assert 문이 하나라면 하나의 테스트를 이해하는 것이 수월하다는 장점이 있지만 중복되는 코드가 많아질 수 있습니다.

- 하나의 개념 당 assert 문 수를 최소로 줄이고, 테스트 함수 하나는 개념 하나만 테스트하는 것이 좋습니다.

## F.I.R.S.T. 원칙

- Fast, 빠르게: 테스트는 빨라야 합니다.
- Independent, 독립적으로: 각 테스트는 서로 의존하면 안 됩니다.
- Repeatable, 반복 가능하게: 테스트는 어떤 환경에서도 반복 가능해야 합니다. 실제 환경, QA 환경, 네트워크가 연결되지 않은 컴퓨터에서도 실행할 수 있어야 합니다.
- Self-Validating, 자가검증하는: 테스트는 bool 값으로 결과를 내야 합니다.
- Timely, 적시에: 테스트는 적시에 작성해야 합니다. 테스트를 먼저 작성하고 실제 코드를 구현해야 합니다.

### 테스트 메서드명 작성 기준

- test: test 접두사로 시작해야 테스트 메서드로 인식합니다.
- unit of work: 행위를 작성합니다.
- state: 입력값과 초기 상태를 작성합니다.
- outcome: 예상하는 결과값을 작성합니다.
- 각 명칭 사이에 '_' 를 사용하여 구분합니다.

![testNaming](assets/testNaming.png)

### 참고 링크

---

> [테스트 주도 개발](https://book.naver.com/bookdb/book_detail.nhn?bid=7443642)
>
> [Clean Code](https://book.naver.com/bookdb/book_detail.nhn?bid=7390287)