import UIKit
import SnapKit

// ViewController는 UIViewController를 상속 받음
class ViewController: UIViewController {
    
    // 클래스 외부에서 접근하지 못하도록 private으로 접근 제한
    private let label = UILabel()
    
    // 상위 클래스(UIVC)의 viewDidLoad() 함수를 재정의
    // SceneDelegate가 ViewController를 띄우면 viewDidLoad()를 따로 호출하지 않아도 UIKit이 자동으로 호출함
    override func viewDidLoad() {
        // super는 상위 클래스를 가르키며, 재정의 할 때 상위 클래스의 함수를 쓰고 싶으면 super 사용
        super.viewDidLoad()
        configureUI()
        setStackView()
    }
    
    // UI를 설정해주는 함수
    private func configureUI() {
        view.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        // 뷰에 label 노출
        view.addSubview(label)
        
        // label 제약조건 설정
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
    
    // StackView를 만드는 함수
    private func setStackView() {
        
        // 배열 안에 또 배열이 들어가 있는 2차원 배열(2D Array) 구조
        let rows = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"]
        ]
        
        // verticalStackView 생성
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        // rows의 각 줄을 horizontalSV로 만들고 verticalSV에 추가
        for row in rows {
            let buttons = row.map { element -> UIButton in
                let button = UIButton()
                
                button.setTitle(element, for: .normal)
                button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                
                // button의 height/width는 80이며, 정사각형일 때는 모서리 반경(= cornerRadius)을 1/2로 설정하면 원형이 됨
                button.layer.cornerRadius = 40
                
                button.snp.makeConstraints {
                    $0.height.width.equalTo(80)
                }
                
                // 연산자를 orange 색으로 변경
                if Int(element) != nil {
                    button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                } else {
                    button.backgroundColor = .orange
                }
                return button
            }
            
            // horizontalSV 생성 함수 호출
            let horizontalStackView = makeHorizontalStackView(buttons)
            // horizontalSV를 verticalSV에 자동으로 정렬
            verticalStackView.addArrangedSubview(horizontalStackView)
            
            // horizontalSV에 들어있는 button 크기가 고정되어 있기 때문에 생략해도 동작함
            horizontalStackView.snp.makeConstraints {
                $0.height.equalTo(80)
            }
        }
        
        // 뷰에 verticalStackView 노출
        view.addSubview(verticalStackView)
        
        // 제약 조건에서 위치를 설정할 때는(ex. equalToSuperView) SuperView가 정의되어 있어야하므로 view.addSubview(verticalStackView) 밑에 작성
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }

    }
    
    // [UIView] 타입의 views를 받아 UIStackView로 반환 -> buttons를 파라미터로 받아 stackView로 만들어주는 함수
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        return stackView
    }
    
    private func makeButton() {
        
    }
}
