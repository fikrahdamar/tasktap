import SwiftUI
import SwiftData

// MARK: - RitualView

struct RitualView: View {

    @State private var viewModel = RitualViewModel()
    @Query private var allTasks: [TaskItem]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignTokens.Spacing.xl) {
                header
                    .padding(.horizontal, DesignTokens.Spacing.lg)

                RitualCalendarGrid(viewModel: viewModel, allTasks: allTasks)
                    .padding(.horizontal, DesignTokens.Spacing.lg)

                DailyAgendaView(
                    tasks: viewModel.tasks(for: viewModel.selectedDate, in: allTasks),
                    dateLabel: viewModel.agendaDateLabel
                )
                .padding(.horizontal, DesignTokens.Spacing.lg)
            }
            .padding(.vertical, DesignTokens.Spacing.xl)
        }
        .background(Color(.systemGroupedBackground))
    }

    // MARK: - Header
    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: DesignTokens.Spacing.xs) {
                Text(viewModel.monthLabel)
                    .font(.inter(.medium, size: DesignTokens.Font.metadata))
                    .foregroundStyle(Color.greyText)
                Text("Ritual\nCalendar")
                    .font(.inter(.black, size: 36))
                    .foregroundStyle(Color.defaultText)
                    .lineSpacing(2)
            }

            Spacer()

            HStack(spacing: DesignTokens.Spacing.sm) {
                navButton(icon: "chevron.left") { viewModel.goToPreviousMonth() }
                navButton(icon: "chevron.right") { viewModel.goToNextMonth() }
            }
            .padding(.top, DesignTokens.Spacing.xs)
        }
    }

    private func navButton(icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(Color.defaultText)
                .frame(width: 40, height: 40)
                .background(Color.card)
                .clipShape(RoundedRectangle(cornerRadius: DesignTokens.Radius.button))
        }
    }
}

// MARK: - Preview

#Preview {
    RitualView()
        .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
}
