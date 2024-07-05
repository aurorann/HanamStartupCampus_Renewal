<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- # common: head start -->
	<%@ include file="/WEB-INF/head.jsp"%>
    <!-- # common: head end -->

	<!-- # include: script start -->
    <%@ include file="./include/script.jsp"%>
    <!-- # include: script end -->
	<!-- # include: stylesheet start -->
	<%@ include file="./include/stylesheet.jsp"%>
	<!-- # include: stylesheet end -->
</head>


<body>
	
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   
	
	<!-- # common: header-menu-img start -->
    <%@ include file="./include/header-menu-img.jsp"%>
    <!-- # common: header-menu-img end -->   

    <div class="sub_container in_1400">
		<!-- # include: side-menu start -->
		<%@ include file="./include/side-menu.jsp"%>
		<!-- # include: side-menu end -->
		<main>
            
            <div class="right-contents col-lg-9">
                <!-- # include: title-box start -->
                <%@ include file="./include/title-box.jsp"%>
                <!-- # include: title-box end -->

                <div class="col-lg-12 r-contents">
                   	${CONTENT}
                    <%-- <div class="col-lg-12" style="margin:0; padding:0;">
                        <h3 class="m-title"><img src="<c:url value='/resources/img/sub-title.png' />">&nbsp;&nbsp;조직도</h3>
                    </div>

                    <div class="col-lg-12" style="margin:0; padding:0; padding:30px 0;">
                        <p style="text-align:center;"><img src="<c:url value='/resources/img/sub/sub1-5.png' />" alt="조직도" usemap="#img-map1"></p>
                        <!-- <map name="img-map1">
                            <area shape="rect" coords="257,60,436,166" href="javascript:openModal('img-map1');" alt="센터장 이력서" onfocus="blur(0)">
                            <area shape="rect" coords="257,180,436,280" href="javascript:openModal('img-map2');" alt="수석매니저 이력서" onfocus="blur(0)">
                        </map> -->
                        

                        <div class="r-modal"></div>
                        <div class="modal-con img-map1">
                            <a href="javascript:;" class="close"><img src="<c:url value='/resources/img/close-btn.png' />"></a>
                            <div class="modal-title">
                                <h3><img src="<c:url value='/resources/img/sub-title.png' />">&nbsp;&nbsp;센터장 소개</h3>
                            </div>
                            
                            <div id="resume-tab">
                                <ul class="resume-tabs">
                                    <li class="active" rel="resume-tab1-1">기본사항</li>
                                    <li rel="resume-tab1-2">경력사항</li>
                                    <li rel="resume-tab1-3">주요 프로젝트 수행</li>
                                </ul>
                                <div class="resume-tab_container">
                                    <div id="resume-tab1-1" class="tab_content">
                                        <div class="col-lg-3 resume-img">
                                            <img src="<c:url value='/resources/img/sub/img-map1.png' />" alt="하남스타트업캠퍼스 센터장">
                                        </div>
                                        <div class="col-lg-9">

                                            <div class="b-text">
                                                <ul>
                                                    <li>
                                                        <span><strong>성명</strong></span>
                                                        <span>박준수(朴埈秀)</span>
                                                    </li>
                                                    <li>
                                                        <span><strong>전공분야</strong></span>
                                                        <span>경영학(재무), 경제학(금융경제),공학(전자통신)</span>
                                                    </li>
                                                    <li>
                                                        <span><strong>자격증</strong></span>
                                                        <span>기술거래사, 기술사업가치평가사</span>
                                                    </li>
                                                    <li>
                                                        <span><strong>학력사항</strong></span>
                                                        <span>
                                                            <table class="table-sm">
                                                                <tbody><tr>
                                                                    <th>학교명</th>
                                                                    <th>학위</th>
                                                                    <th>전공</th>
                                                                    <th>비고</th>
                                                                </tr>
                                                                <tr>
                                                                    <td>서울시립대학교</td>
                                                                    <td>경영학사</td>
                                                                    <td>경영학사</td>
                                                                    <td>졸업</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>서강대학교 대학원</td>
                                                                    <td>경제학석사</td>
                                                                    <td>금융경제</td>
                                                                    <td>졸업</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>한양대학교 대학원</td>
                                                                    <td>공학석사</td>
                                                                    <td>전자통신</td>
                                                                    <td>졸업</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>숭실대학교 대학원</td>
                                                                    <td>경영학석사</td>
                                                                    <td>경영지도</td>
                                                                    <td>졸업</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>단국대학교 대학원</td>
                                                                    <td>경영학박사</td>
                                                                    <td>재무관리</td>
                                                                    <td>졸업</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>휴넷마케팅MBA(온라인)</td>
                                                                    <td></td>
                                                                    <td>마케팅</td>
                                                                    <td>수료</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>휴넷전략MBA(온라인)</td>
                                                                    <td></td>
                                                                    <td>경영전략</td>
                                                                    <td>수료</td>
                                                                </tr>
                                                                
                                                            </tbody></table>
                                                        </span>
                                                    </li>
                                                    <li>
                                                        <span><strong>논문(저술)</strong></span>
                                                        <span>
                                                            <table class="table-sm">
                                                                <tbody>
                                                                    <tr>
                                                                        <th>논문</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <p>1. 특허취득공시가 기업가치에 미치는 영향에 관한 실증적 연구</p>
                                                                            <p>2. 홈네트워크시스템 표준화 연구 및 응용 </p>
                                                                            <p>3. 중소기업도산예측을 위한 중소기업종합평가표 유용성에 관한 연구</p>
                                                                            <p>4. 금융산업개편에 따른 리스전업사의 대응방안 연구</p>
                                                                            <p>5. 미백화장품 국내외 시장경쟁력 확보방안연구(공동:박준수,김흥기)</p>
                                                                            <p>6. 사용자 주도의 개방형 혁신을 통한 국내 스타트업 대상의 정부 자금지원 개선 방안 제언: 신용보증기금을 중심으로</p>
                                                                            <p>7. 경기테크노벨리 성장요인 분석을 통한 발전방안 연구(2018, 경기도)</p>
                                                                            <p>8. 제주도 팜파스곤충랜드 사업타당성 연구(2017, 네이처월드(주))</p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>저술</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <p>1. Death Valley 극복을 위한 기술사업화 투자계약 가이드</p>
                                                                            <p>2. 세계속의 소상공인(공동: 박준수, 정우성)</p>
                                                                            <p>3. 기술금융이야기(공동: 박준수, 김창화)</p>
                                                                            <p>4. 평가위원 관점의 사업계획서(공동: 박준수, 김창화)</p>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </span>
                                                    </li>
                                                 </ul>
                                            </div>

                                            
                                        </div>
                                    </div>
                                    <div id="resume-tab1-2" class="tab_content">
                                        <div class="col-lg-12">

                                            <h3>경력/경험사항</h3>
                                            <table class="table-sm">
                                                <tbody>
                                                <tr>
                                                    <th width="20%">소속</th>
                                                    <th width="30%">역할</th>
                                                    <th width="20%">활동기간</th>
                                                    <th width="30%">활동내용</th>
                                                </tr>
                                                <tr>
                                                    <td>하남스타트업캠퍼스</td>
                                                    <td>센터장</td>
                                                    <td>2020년 8월 ~ 현재</td>
                                                    <td>Start-up창업,발굴,육성
                                                        (의약/바이오/헬스케어 등)
                                                        엑셀레이터,
                                                        하남기업유치</td>
                                                </tr>
                                                <tr>
                                                    <td>비에스투자파트너스</td>
                                                    <td>파트너/부사장</td>
                                                    <td>2018년 9월 ~ 현재</td>
                                                    <td>직접투자(벤처기업)</td>
                                                </tr>
                                                <tr>
                                                    <td>(사)한국기술거래사회</td>
                                                    <td>부회장(비상근)</td>
                                                    <td>2019년1월 ~ 현재</td>
                                                    <td>기술거래, 기술사업화, 기술가치평가</td>
                                                </tr>
                                                <tr>
                                                    <td>한양대학교</td>
                                                    <td>산학교수</td>
                                                    <td>2014년09월 ~ 2015년11월</td>
                                                    <td>기술창업, 기술금융, 가족기업지원</td>
                                                </tr>
                                                <tr>
                                                    <td>순천향대학교</td>
                                                    <td>산학교수</td>
                                                    <td>2012년03월 ~ 2014년08월</td>
                                                    <td>기술창업, 기술사업화, 기술이전, 기술금융, 가족기업지원</td>
                                                </tr>
                                                <tr>
                                                    <td>전북테크노파크</td>
                                                    <td>기업지원단장/기술이전센터장/전북기술지주회사이사</td>
                                                    <td>2011년01월 ~ 2011년09월</td>
                                                    <td>기업지원, 기술사업화, 인력양성</td>
                                                </tr>
                                                <tr>
                                                    <td>충남테크노파크</td>
                                                    <td>기업지원단장/기술이전센터장/창업보육센터장</td>
                                                    <td>2007년11월 ~ 2010년11월</td>
                                                    <td>기업지원, 기술사업화, 창업보육</td>
                                                </tr>
                                                <tr>
                                                    <td>서린바이오사이언스 (주)</td>
                                                    <td>기획전략본부장/이사</td>
                                                    <td>2006년09월 ~ 2007년06월</td>
                                                    <td>기획, 전략, CFO, 국제</td>
                                                </tr>
                                                <tr>
                                                    <td>한국벤처투자</td>
                                                    <td>투자부/부장</td>
                                                    <td>2000년05월 ~ 2005년05월 </td>
                                                    <td>투자, 창업보육</td>
                                                </tr>
                                                <tr>
                                                    <td>아주아이비투자</td>
                                                    <td>영업부/부장</td>
                                                    <td>1996년08월 ~ 2000년05월 </td>
                                                    <td>투자, 융자, 리스</td>
                                                </tr>
                                                <tr>
                                                    <td>한국종합케피탈</td>
                                                    <td>영업팀/팀장</td>
                                                    <td>1989년09월 ~  1996년08월 </td>
                                                    <td>리스,자금</td>
                                                </tr>
                                                <tr>
                                                    <td>신용보증기금</td>
                                                    <td>영업점/행원</td>
                                                    <td>1984년10월 ~ 1989년09월 </td>
                                                    <td>신용보증, 신용조사</td>
                                                </tr>
                                                </tbody>
                                            </table>

                                            <h3 class="mg-top-30">표창</h3>
                                            
                                            <table class="table-sm">
                                                <tbody>
                                                    <tr>
                                                        <th>표창</th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <p>● 산업통상자원부장관 표창(2019, 제127679호, 금융지원 공로)</p>
                                                            <p>● 지식경제부장관 표창(2009, 제80715호, 기술사업화대상, 기술금융 공로) </p>
                                                            <p>● 중소기업청장 표창(2009, 제6426호, 벤처기업육성 공로)  </p>
                                                            <p>● 중소기업중앙회장 표창(2011, 제2011-641호, 중소기업육성 공로)</p>
                                                            <p>● KAIST경영대학장 표창(2020, 글로벌리더상)</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div id="resume-tab1-3" class="tab_content">
                                        <div class="col-lg-12">

                                            <h3>주요 프로젝트 수행</h3>

                                            <table class="table-sm">
                                                <tbody>
                                                    <tr>
                                                        <th>주요 프로젝트 수행</th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <p>● 기술가치평가(10건)(2019)</p>
                                                            <p>● 기술사업화 투자(116건, 619억)프로젝트(1996~2005)
                                                                ☞ 코스닥상장 38건, 나스닥상장 1건, 나스닥 M&A 1건, 국내 M&A 4건</p>
                                                            <p>● 다산인큐베이팅펀드(150억) 결성·운용(2001)</p>
                                                            <p>● 성남다산펀드(100억) 결성·운용(2002)</p>
                                                            <p>● 다산이노텍펀드(100억) 결성·운용(2002)</p>
                                                            <p>● 테크노블러더&다산IT펀드(20억) 결성·운용(2002)</p>
                                                            <p>● 다산벤처펀드(800억) 결성·운용(2003)</p>
                                                            <p>● 중앙대학교 창업대학원 겸임교수(2005~2006, 박준수)</p>
                                                            <p>● 한국벤처케피탈협회 기획전문위원(2003~2005, 박준수)</p>
                                                            <p>● 진도홍주 명품화프로젝트(2005)</p>
                                                            <p>● 소방검정공사 경영혁신프로젝트(2006)</p>
                                                            <p>● 해외기술사업화 투자(1건, 10억)프로젝트(2007)</p>
                                                            <p>● 중부서남권 바이오기술사업화 프로젝트(2008)</p>
                                                            <p>● 충청광역경제권 협력프로젝트(2008)</p>
                                                            <p>● 충남스타펀드(160억) 결성(2009)</p>
                                                            <p>● 충청권광역선도산업 그린반도체 기업지원프로젝트(2009)</p>
                                                            <p>● 충청권광역선도산업 의약바이오 기업지원프로젝트(2009)</p>
                                                            <p>● 대한민국창업대전 BI우수(전국18개중)기관 선정(중소기업청,2010,CTP)</p>
                                                            <p>● 중부권기술사업화평가 최우수(전국9개중)기관 선정(지경부, 2009, CTP)</p>
                                                            <p>● 기술이전센터평가 최우수(전국14개중)기관 선정(지경부, 2008,2009,CTP)</p>
                                                            <p>● 테크노파크평가 최우수(전국18개중)기관 선정(지경부, 2008, 2009, CTP) </p>
                                                            <p>● 중부권기술사업화 거래촉진네트워크프로젝트(2010, CTP, PM)</p>
                                                            <p>● KTX천안아산 충남테크비즈존 기획(2010)</p>
                                                            <p>● 전북기술이전센터 지경부 지정획득(2011.5, 전북테크노파크, PM)</p>
                                                            <p>● 전북대학연합기술지주회사 설립(2011.7, 전북테크노파크, PM)</p>
                                                            <p>● 전북기술이전센터 지경부인가(2011)</p>
                                                            <p>● 전북대학기술지주회사 설립(2011)</p>
                                                            <p>● 전북기업 융복합고급인력양성프로젝트(2011)</p>
                                                            <p>● 부안신재생에너지단지 운영프로젝트(2011)</p>
                                                            <p>● 순천향대 산학협력선도대학(LINC) 육성사업프로젝트(2012)</p>
                                                            <p>● 순천향대 산학연구마을 프로젝트(2013)</p>
                                                            <p>● 순천향대 창업선도대학 프로젝트(2014)</p>
                                                            <p>● 서린바이오사이언스(주) 글로벌센터 운영전략 연구(2017,PM)</p>
                                                            <p>● 제주팜파스곤충랜드 사업타당성전략 연구(2017,PM)</p>
                                                            <p>● 경기도 테크노벨리 발전방안 연구(2018,PM) </p>
                                                            <p>● 지역 특화형 대학 기술사업화 지원방안 기획연구(2019,PM)</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                        </div>

                        <div class="r-modal"></div>
                        <div class="modal-con img-map2">
                            <a href="javascript:;" class="close"><img src="<c:url value='/resources/img/close-btn.png' />"></a>
                            <div class="modal-title">
                                <h3><img src="<c:url value='/resources/img/sub-title.png' />">&nbsp;&nbsp;수석매니저 소개</h3>
                            </div>

                            <div id="resume-tab">
                                <ul class="resume-tabs2">
                                    <li class="active" rel="resume-tab2-1">기본사항</li>
                                    <li rel="resume-tab2-2">경력사항</li>
                                    <li rel="resume-tab2-3">주요 프로젝트 수행</li>
                                </ul>
                                <div class="resume-tab_container">
                                    <div id="resume-tab2-1" class="tab_content2">
                                        <div class="col-lg-3 resume-img">
                                            <img src="<c:url value='/resources/img/sub/img-map2.png' />" alt="하남스타트업캠퍼스 수석매니저">
                                        </div>
                                        <div class="col-lg-9">

                                            <div class="b-text">
                                                <ul>
                                                    <li>
                                                        <span><strong>성명</strong></span>
                                                        <span>박주용(朴柱龍)</span>
                                                    </li>
                                                    <li>
                                                        <span><strong>전공분야</strong></span>
                                                        <span>화학공학(분자생물공학)</span>
                                                    </li>
                                                    <li>
                                                        <span><strong>자격증</strong></span>
                                                        <span>기술거래사, 기술사업가치평가사, 창업보육전문매니저, 교원자격증</span>
                                                    </li>
                                                    <li>
                                                        <span><strong>학력사항</strong></span>
                                                        <span>
                                                            <table class="table-sm">
                                                                <tbody><tr>
                                                                    <th>학교명</th>
                                                                    <th>학위</th>
                                                                    <th>전공</th>
                                                                    <th>비고</th>
                                                                </tr>
                                                                <tr>
                                                                    <td>전북대학교</td>
                                                                    <td>공학사</td>
                                                                    <td>공업화학</td>
                                                                    <td>졸업</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>전북대학교 대학원</td>
                                                                    <td>공학석사</td>
                                                                    <td>화학공학</td>
                                                                    <td>졸업</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>전북대학교 대학원</td>
                                                                    <td>공학박사</td>
                                                                    <td>화학공학</td>
                                                                    <td>졸업</td>
                                                                </tr>
                                                            </tbody></table>
                                                        </span>
                                                    </li>
                                                    <li>
                                                        <span><strong>논문(저술)</strong></span>
                                                        <span>
                                                            <table class="table-sm">
                                                                <tbody>
                                                                    <tr>
                                                                        <th>논문</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <p>1. Evaluation of the CO2 reduction capacity of Rhodobacter  sphaeroides immobilized on phthalocyanine based photosensitizers.</p>
                                                                            <p>2. Enhanced hydrogen production by co-cultures of hydrogenase and nitrogenase in Escherichia coli.</p>
                                                                            <p>3. The Effect of CbbR-Binding Affinity to the Upstream of cbbF and cfxB on the Metabolic Effector in Rhodobacter sphaeroides.</p>
                                                                            <p>4. Activity and characterization of mixed organic compounds extracted from Rhodobacter sphaeroides as alternative materials to serum for mammalian cell growth.</p>
                                                                            <p>5. Effects of Extracted from Photosynthetic Bacteria on the Growth and Quality of Lettuce(Lactuca sativa L.) in a LED-Plant Factory.</p>
                                                                            <p>6. Cellular Responses to Alcohol in Escherichia coli, Clostridium acetobutylicum and Saccharomyces cerevisiae. </p>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </span>
                                                    </li>
                                                 </ul>
                                            </div>

                                            
                                        </div>
                                    </div>
                                    <div id="resume-tab2-2" class="tab_content2">
                                        <div class="col-lg-12">
                                            <h3>경력/경험사항</h3>
                                            <table class="table-sm">
                                                <tbody>
                                                <tr>
                                                    <th width="20%">소속</th>
                                                    <th width="30%">역할</th>
                                                    <th width="20%">활동기간</th>
                                                    <th width="30%">활동내용</th>
                                                </tr>
                                                <tr>
                                                    <td>하남스타트업캠퍼스</td>
                                                    <td>수석매니저</td>
                                                    <td>2020년 8월 ~ 현재</td>
                                                    <td>Start-up창업,발굴,육성 (의약/바이오/헬스케어 등)</td>
                                                </tr>
                                                <tr>
                                                    <td>(재)전북생물산업진흥원</td>
                                                    <td>주임연구원</td>
                                                    <td>2018년07월 ~  2020년07월</td>
                                                    <td>R&D 발굴 수행, 기술사업화 및 기술이전</td>
                                                </tr>
                                                <tr>
                                                    <td>전북대학교</td>
                                                    <td>연구교수</td>
                                                    <td>2014년03월 ~ 2018년07월</td>
                                                    <td>R&D 발굴 및 연구 수행,사업기획 및 제품개발</td>
                                                </tr>
                                                <tr>
                                                    <td>Max Plank Institute for terrestrial Microbiology</td>
                                                    <td>파견연구원</td>
                                                    <td>2012년07월 ~ 2012년08월</td>
                                                    <td>신규 단백질 분리 및 정제</td>
                                                </tr>
                                                <tr>
                                                    <td>National Institute of Advanced Industrial Science and Technology</td>
                                                    <td>파견연구원</td>
                                                    <td>2011년01월 ~  2011년02월</td>
                                                    <td>셀룰로스 나노섬유 개발 및 적용 방법 연구</td>
                                                </tr>
                                                <tr>
                                                    <td>㈜창해에탄올</td>
                                                    <td>파견연구원</td>
                                                    <td>2008년09월 ~  2009년04월</td>
                                                    <td>바이오에탄올 생산 및 공정 개발</td>
                                                </tr>
                                                </tbody>
                                            </table>

                                            <h3 class="mg-top-30">수상</h3>

                                            <table class="table-sm">
                                                <tbody>
                                                    <tr>
                                                        <th>논문</th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <p>● 전북생물산업진흥원장 표창(2018,)</p>
                                                            <p>● 한국생물공학회(2009, 2010), 한국화학공학회(2011), 한국미생물생명공학회(2013, 2015), 대한환경공학회(2016) 우수상 6건</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div id="resume-tab2-3" class="tab_content2">
                                        <div class="col-lg-12">
                                            <h3>주요 프로젝트 수행</h3>

                                            <table class="table-sm">
                                                <tbody>
                                                    <tr>
                                                        <th>주요 프로젝트 수행</th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <p>● 기술가치평가(6건)(2019~2021)</p>
                                                            <p>● 기술이전 및 중개 16건(이전 12건, 중개 4건)</p>
                                                            <p>● R&D 사업 수행 18건(중기부, 농진청, 농림부, 한국연구재단, 산자부 등)</p>
                                                            <p>● 연구소기업 설립 3건</p>
                                                            <p>● 유전체 정보 등록 6건(NCBI, NABIC)</p>
                                                            <p>● 국내외 학술발표 63건(국제 28건, 국내 45건)</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    
                    </div>

                    <div class="col-lg-12 mg-top-60">
                        <h3 class="m-title"><img src="/startupcampus/resources/img/sub-title.png">&nbsp;&nbsp;담당업무 및 연락</h3>

                        <table class="table">
                            <thead>
                                <tr>
                                	<th width="20%">소속</th>
                                    <th width="11%">직위</th>
                                    <th width="10%">성명</th>
                                    <th width="21%">이메일</th>
                                    <th width="18%">전화번호</th>
                                    <th width="20%">담당업무</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                	<td rowspan="4">하남도시공사<br>본사</td>
                                    <td>부장</td>
                                    <td>고상미</td>
                                    <td>sangmi@huic.co.kr</td>
                                    <td>031-790-9586</td>
                                    <td>기업지원부 업무 총괄</td>
                                </tr>
                                <tr>
                                    <td>과장</td>
                                    <td>우광명</td>
                                    <td>wkm@huic.co.kr</td>
                                    <td>031-790-9534</td>
                                    <td>기업유치 및 육성지원</td>
                                </tr><tr>
                                    <td>대리</td>
                                    <td>이상준</td>
                                    <td>sj@huic.co.kr</td>
                                    <td>031-790-9590</td>
                                    <td>기업유치 및 육성지원</td>
                                </tr>
                                    <tr><td>주임</td>
                                    <td>정예빈</td>
                                    <td>yebin2@huic.co.kr</td>
                                    <td>031-790-9529</td>
                                    <td>기업유치 및 육성지원</td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <br><br>
                        
                        <table class="table">
                            <thead>
                                <tr>
                                	<th width="20%">소속</th>
                                    <th width="11%">직위</th>
                                    <th width="10%">성명</th>
                                    <th width="21%">이메일</th>
                                    <th width="18%">전화번호</th>
                                    <th width="20%">담당업무</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                	<td rowspan="3">하남스타트업캠퍼스</td>
                                    <td>차장</td>
                                    <td>송민주</td>
                                    <td>smj11@huic.co.kr</td>
                                    <td>031-790-9532</td>
                                    <td>캠퍼스 업무 총괄</td>
                                </tr>
                                <tr>
                                    <td>운영매니저</td>
                                    <td>고승호</td>
                                    <td>ksh0969@huic.co.kr</td>
                                    <td>031-790-9512</td>
                                    <td>캠퍼스 운영</td>
                                </tr>
                                <tr>
                                    <td>주임</td>
                                    <td>전찬호</td>
                                    <td>jch@huic.co.kr</td>
                                    <td>031-790-9511</td>
                                    <td>캠퍼스 운영</td>
                                </tr>
                            </tbody>
                        </table>
                    </div> --%>

                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
		</main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	
	<!-- extension end -->
	

</body>
</html>