import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // view가 load 되었을 때 아래 함수 실행
        configureUI()
        setStackView()
    }
    
    private func configureUI() {
        // UILabel 속성
        view.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        // view에 노출
        view.addSubview(label)
        
        // autolayout 설정
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
    
    private func setStackView() {
        
        let elements = ["7", "8", "9", "+"]
        // map 함수를 이용해서 elements의 배열을 하나씩 element라는 상수로 받아서 UIButton을 생성
        let buttons = elements.map { element -> UIButton in
            // 배열마다 UIButton이 생성되어야하므로 반복문 내에서 UIButton 생성
            let button = UIButton()
            button.setTitle(element, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.layer.cornerRadius = 40
            
            button.snp.makeConstraints {
                $0.height.width.equalTo(80)
            }
            return button
        }
        
        // makeHorizontalStackView 함수를 호출해서 stackView에 할당
        let stackView = makeHorizontalStackView(buttons)
        // view에 stackView 노출
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
}
