import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // view가 load 되었을 때 configureUI 함수 실행
        configureUI()
        makeHorizontalStackView()
    }
    
    private func configureUI() {
        // UILabel 속성
        view.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        // view에 노출
        [label]
            .forEach { view.addSubview($0) }
        
        // autolayout 설정
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
            
        }
    }
    
    private func makeHorizontalStackView () {
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        [stackView]
            .forEach { view.addSubview($0) }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        let elements = ["7", "8", "9", "+"]
        for element in elements {
            // 반복문 돌 때마다 버튼을 생성해서 넣어야하기 때문에 반복문 안에서 생성
            let button = UIButton()
            button.setTitle(element, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.layer.cornerRadius = 40
            stackView.addArrangedSubview(button)
            
            button.snp.makeConstraints {
                $0.height.equalTo(80)
                $0.width.equalTo(80)
            }
        }
    }
}
