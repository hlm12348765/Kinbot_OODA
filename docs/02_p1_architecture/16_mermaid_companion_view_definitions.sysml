package KinbotMermaidCompanionViewDefinitions {

    private import StandardViewDefinitions::*;

    view def <tfrv> '系统顶层功能需求视图' specializes GeneralView {
        doc /*
         * 展示问题状态、顶层系统转换、目标状态，以及安全、合规、授权、
         * 资源和低打扰要求。它是 GeneralView 的需求与定义专题化视图。
         */
    }

    view def <oaf> 'OODA跨空间行动流视图' specializes ActionFlowView {
        doc /*
         * 展示 Observe、Orient、Decide、Act、Feedback 的 action usage、
         * 信息与物理 item flow、反馈 succession 及支撑约束。
         */
    }

    view def <l1iv> 'L1递归Agent互连视图' specializes InterconnectionView {
        doc /*
         * 展示信息空间、A1-A8、F1 与物理空间的 part usage 及主干连接。
         * 安全限制和资源策略使用独立连接样式，不与普通协作连接混同。
         */
    }

    view def <acaf> 'AgentCell递归执行行动流视图' specializes ActionFlowView {
        doc /*
         * 展示 Agent Cell 内部 action usage、decision node、guarded succession、
         * 完成、重试、降级与升级分支。
         */
    }

    view def <capsv> '跨Agent行动许可时序视图' specializes SequenceView {
        doc /*
         * 展示目标或事件、A4、执行 Agent、A7、F1 与 A3 之间的事件顺序、
         * 消息和返回，不规定具体线程或部署实现。
         */
    }
}
